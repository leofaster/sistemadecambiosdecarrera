/**
 *
 * @author CHANGE Gate
 */
package clases;

import com.opensymphony.xwork2.ActionContext;
import java.io.File;
import org.apache.commons.io.FileUtils;
import java.io.IOException; 
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

public class FileManager extends ActionSupport implements ServletRequestAware{
    private File archivo;
    private String archivoContentType;
    private String archivoFileName;
    private String destPath;
    private HttpServletRequest request;
    private InputStream archivoInputStream;
    private String fileName;
    private long contentLength;


    public String download() throws Exception {      
        try {
            File tmp = new File(destPath);
            archivoInputStream = new FileInputStream(tmp);
            contentLength = tmp.length();
            return SUCCESS;
        } 
        
        catch (Exception e) {
            return "no success";
        }
     }

    public String upload() {
<<<<<<< HEAD
        addActionMessage("Archivo subido con éxito.");
         try{
          destPath = request.getSession().getServletContext().getRealPath("/");
          Map sesion = ActionContext.getContext().getSession();
=======
        Map sesion = ActionContext.getContext().getSession();
        
         try{
          destPath = request.getSession().getServletContext().getRealPath("/");
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
          String carn = sesion.get("carnet_aux").toString();

          ResultSet rs;
          Statement st;
          ConexionBD.establishConnection();
          st = ConexionBD.getConnection().createStatement();

          rs = st.executeQuery(
                       "SELECT * "
                     + "FROM SOLICITUD "
                     + "WHERE USBID='" + carn + "' "
                       + "AND SOL_ACEPTADA='A'");
          rs.next();

          File destFile  = new File(destPath, carn + archivoFileName);
          FileUtils.copyFile(archivo, destFile);
          System.out.println(destFile.toString());

          st.executeUpdate("INSERT INTO REPORTE VALUES('"
                         + rs.getString(1) + "',"
                         + "CAST('" + rs.getInt(2) + "' AS INTEGER),'"
                         + rs.getTimestamp(3).toString() + "','"
                         + archivoFileName + "','"
                         + destFile.toString() + "')");

<<<<<<< HEAD
          

          System.out.println("Quedo como: " + destFile);

       }catch(Exception e){
          e.printStackTrace();
          return "no success";
       }

=======
          System.out.println("Quedo como: " + destFile);
          

       }catch(Exception e){
          addActionError(e.getMessage());
          sesion.put("error","true");
          return "no success";
       }
       sesion.put("success","true");
>>>>>>> c384fcdcf3fd593ffe3df94644ef02d4fa3958d6
       return "success";
    }

    public File getArchivo() {
       return archivo;
    }
    public void setArchivo(File archivo) {
       this.archivo = archivo;
    }
    public String getArchivoContentType() {
       return archivoContentType;
    }
    public void setArchivoContentType(String archivoContentType) {
       this.archivoContentType = archivoContentType;
    }
    public String getArchivoFileName() {
       return archivoFileName;
    }
    public void setArchivoFileName(String archivoFileName) {
       this.archivoFileName = archivoFileName;
    }

    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

    public String getDestPath() {
        return destPath;
    }

    public void setDestPath(String destPath) {
        this.destPath = destPath;
    }

    public InputStream getArchivoInputStream() {
        return archivoInputStream;
    }

    public void setArchivoInputStream(InputStream archivoInputStream) {
        this.archivoInputStream = archivoInputStream;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public long getContentLength() {
        return contentLength;
    }

    public void setContentLength(long contentLength) {
        this.contentLength = contentLength;
    }
}