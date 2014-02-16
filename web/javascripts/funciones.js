var highlightcolor = "#fc3";
var ns6 = document.getElementById && !document.all;
var previous = '';
var eventobj;


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
// SET FOCUS TO FIRST ELEMENT AND HIDE/SHOW ELEMENTS IF JAVASCRIPT ENABLED
function init() {
    if (document.forms[1] != null && document.forms[1].elements[0] != null) {
        document.forms[1].elements[0].focus();
        document.forms[1].elements[0].select();
    }
}

// REGULAR EXPRESSION TO HIGHLIGHT ONLY FORM ELEMENTS
var intended = /INPUT|TEXTAREA|SELECT|OPTION/;

// FUNCTION TO CHECK WHETHER ELEMENT CLICKED IS FORM ELEMENT
function checkel(which) {
    if (which.style && intended.test(which.tagName)) {
        return true;
    }
    else
        return false;
}
function highlight(e) {
    if (!ns6) {
        eventobj = event.srcElement;
        if (previous !== '') {
            if (checkel(previous))
                previous.style.backgroundColor = '';
            previous = eventobj;
            if (checkel(eventobj))
                eventobj.style.backgroundColor = highlightcolor;
        }
        else {
            if (checkel(eventobj))
                eventobj.style.backgroundColor = highlightcolor;
            previous = eventobj;
        }
    }
}