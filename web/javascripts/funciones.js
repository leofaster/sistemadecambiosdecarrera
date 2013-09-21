function unhide(divID) {
    var item = document.getElementById(divID);
    var otros = document.getElementsByTagName('div');
    var group;
    if (otros) {
        for (var i = 0; i < otros.length; i++) {
            group = otros[i].getAttribute('alt');
            if (group == "especial") {
                otros[i].className = 'hidden';
            }
        }
    }
    if (item) {
        item.className = 'unhidden';
    }
}

function confirmar() {
    document.entrar.submit()
}

function mostrarVentana() {
    var ventana = document.getElementById('miVentana'); // Accedemos al contenedor
    ventana.style.marginTop = "100px"; // Definimos su posición vertical. La ponemos fija para simplificar el código
    ventana.style.marginLeft = ((document.body.clientWidth - 350) / 2) + "px"; // Definimos su posición horizontal
    ventana.style.display = 'block'; // Y lo hacemos visible
}

function ocultarVentana() {
    var ventana = document.getElementById('miVentana'); // Accedemos al contenedor
    ventana.style.display = 'none'; // Y lo hacemos invisible
}
