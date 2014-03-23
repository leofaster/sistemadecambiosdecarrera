package clases;

import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author CHANGE Gate
 */
public class Estudiante extends Usuario {

    private double indice;
    private Carrera carreraOrigen;
    private boolean cbAprobado;
    private Solicitud solicitud;

    public Solicitud getSolicitud() {
        return solicitud;
    }

    public void setSolicitud(Solicitud solicitud) {
        this.solicitud = solicitud;
    }

    /**
     *
     */
    public Estudiante() {
    }

    /**
     *
     * @param usbid
     * 
     * Construye un estudiante a partir de la base de datos.
     * 
     */
    public void cargarDatos(String usbid) {
        this.usbid = usbid;
        ResultSet rs;
        Statement st;
        ConexionBD.establishConnection();
        
        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery(
                      "SELECT * "
                    + "FROM ESTUDIANTE NATURAL JOIN USUARIO "
                    + "WHERE USBID = '" + this.usbid + "'"
                    );

            if (rs.next()) {
                this.cedula = rs.getInt("cedula");
                this.nombre = rs.getString("nombre");
                this.apellido = rs.getString("apellido");
                this.indice = rs.getDouble("indice");
                this.carreraOrigen = new Carrera(rs.getInt("codcarrera"));
                this.cbAprobado = rs.getBoolean("cb_aprobado");
            } else {
                System.out.println("No se puede crear el estudiante.");
            }
        
            rs.close();
            st.close();

        } catch (Exception e) {
            System.out.println("Problem in Estudiante.Estudiante(usbid)");
        }
    }
    
    public void cargarExtraplanes() {
        ResultSet rs;
        Statement st;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            List<AsignaturaConNota> li;
            li = new ArrayList<AsignaturaConNota>();
            Asignatura asignatura;
            AsignaturaConNota asignaturaCN;

            rs = st.executeQuery("select * from recomienda natural join asignatura"
                    + " where usbid='" + this.usbid
                    + "' order by codasignatura");
            System.out.println("Estudiante: " + this.usbid);
            while (rs.next()) {
                asignatura = new Asignatura();
                asignatura.setCodigoS(rs.getString("codasignatura"));
                asignatura.setNombre(rs.getString("nombre"));

                asignaturaCN = new AsignaturaConNota();
                asignaturaCN.setAsignatura(asignatura);
                asignaturaCN.setNota(rs.getInt("nota_min"));
                System.out.println("Extraplan: " + asignatura.getNombre());
                System.out.println("Codigo: " + asignatura.getCodigoS());
                System.out.println("Nota: " + asignaturaCN.getNota());
                li.add(asignaturaCN);
            }

            request.setAttribute("listaExtraplanes", li);
            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void cargarInformeAcademico() {
        ResultSet rs;
        Statement st;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            List<AsignaturaConNota> li;
            li = new ArrayList<AsignaturaConNota>();
            Asignatura mb;
            AsignaturaConNota mb2;

            rs = st.executeQuery("select * from calificacion natural join asignatura"
                    + " where usbid='" + this.usbid
                    + "' order by codasignatura");
            while (rs.next()) {
                mb = new Asignatura();
                mb.setCodigoS(rs.getString("codasignatura"));
                mb.setNombre(rs.getString("nombre"));

                mb2 = new AsignaturaConNota();
                mb2.setAsignatura(mb);
                mb2.setNota(rs.getInt("nota"));
                li.add(mb2);
            }

            request.setAttribute("materias", li);
            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void cargarArchivos() {
        ResultSet rs;
        Statement st;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            List<Reporte> li;
            li = new ArrayList<Reporte>();
            Reporte rep;

            String carn = request.getParameter("carnet");
            
            rs = st.executeQuery("select * from reporte "
                    + "where usbid='" + this.usbid
                    + "'");

            while (rs.next()) {
                rep = new Reporte();
                rep.setNombre(rs.getString("nombre"));
                rep.setRuta(rs.getString("ruta"));
                li.add(rep);
            }

            request.setAttribute("archivos", li);
            rs.close();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String visualizarDatosCambio() {
        ResultSet rs;
        Statement st;

        try {
            ConexionBD.establishConnection();
            st = ConexionBD.getConnection().createStatement();

            // Se obtiene el carnet y el nombre del request
            String carn = request.getParameter("carnet");
            
            // Se obtiene la sesión para guardar los datos conseguidos
            Map sesion = ActionContext.getContext().getSession();
            
            if (carn != null) {
                sesion.put("carnet_aux", carn);
            }
            
            carn = sesion.get("carnet_aux").toString();

            rs = st.executeQuery(
                      "SELECT * "
                    + "FROM SOLICITUD "
                    + "WHERE USBID='" + carn + "' "
                      + "AND SOL_ACEPTADA='A'");
            rs.next();
            
            this.cargarDatos(carn);
            Carrera aux = new Carrera(rs.getInt("codcarrera"));
            this.solicitud = new Solicitud();
            this.solicitud.setMotivacion(rs.getString("motivacion"));
            this.solicitud.setAdvertencia(rs.getString("advertencia"));
            this.solicitud.setCarrera(aux);          

            rs.close();
            st.close();
            
            this.cargarInformeAcademico();
            this.cargarArchivos();
            this.cargarExtraplanes();
            return sesion.get("rol").toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "no success";
        }
    }
    
    /**
     *
     * @return
     */
    public double getIndice() {
        return indice;
    }

    /**
     *
     * @param indice
     */
    public void setIndice(double indice) {
        this.indice = indice;
    }

    /**
     *
     * @return
     */
    public Carrera getCarreraOrigen() {
        return carreraOrigen;
    }

    /**
     *
     * @param carreraOrigen
     */
    public void setCarreraOrigen(Carrera carreraOrigen) {
        this.carreraOrigen = carreraOrigen;
    }

    /**
     *
     * @return
     */
    public boolean isCbAprobado() {
        return cbAprobado;
    }

    /**
     *
     * @param cbAprobado
     */
    public void setCbAprobado(boolean cbAprobado) {
        this.cbAprobado = cbAprobado;
    }
    
    /**
     *
     * @return
     * @throws Exception
     * 
     * Verifica si un estudiante tiene el ciclo básico aprobado. Consulta todas
     * las materias que corresponden al ciclo básico de la carrera que el
     * estudiante cursa y las compara con las cursadas. Si todas las materias
     * del ciclo básico fueron cursadas y aprobadas (>3), devuelve verdadero.
     * 
     */
    public boolean verificarCicloBasicoAprobado() throws Exception {
        
        ResultSet rs;
        Statement st;
        ConexionBD.establishConnection();
        List<String> aprobadas = null;
        aprobadas = new ArrayList<String>();
        List<String> obligatorias = null;
        obligatorias = new ArrayList<String>();
        String s;

        try {
            st = ConexionBD.getConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM ESTUDIANTE NATURAL JOIN CURSA NATURAL JOIN CALIFICACION WHERE NOTA >= '3' AND USBID = '" + this.usbid + "'");

            while (rs.next()) {
                s = rs.getString("codasignatura");
                aprobadas.add(s);
            }
            
            rs = st.executeQuery("SELECT * FROM CICLO_BASICO WHERE CODCARRERA='" + this.carreraOrigen.getCodcarrera() + "'");

            while (rs.next()) {
                s = rs.getString("codasignatura");
                obligatorias.add(s);
            }

            rs.close();
            st.close();

        } catch (Exception e) {
            System.out.println("Problem in searching the database verificarCicloBasicoAprobado");
        }

        boolean aprobado = true;

        for (Object objList : obligatorias) {
            aprobado = aprobadas.contains(objList);
            if (!aprobado) {
                break;
            }
        }
        return aprobado;
    }
}
