var id;
function eliminar() {
    console.log(id);
    swal({
        title: "Estas seguro?",
        text: "Se reportará con los consejeros la publicación.",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            console.log("Antes del url js ");
            var url = "ReporteServlet?accion=reportar";
            $.ajax({
                type: 'POST',
                url: url,
                data: {id: id},
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    location.href="MainPage.jsp";

                }
            });
            
            swal("Se ha reportado correctamente la publicación, de ser necesario se le dará el seguimiento requerido.", {
                icon: "success",

            });
           location.reload();
        } else {
            swal("Aún no se ha reportado ninguna publicación.");
        }
        
        
        
        
    });

}

function eliminarPub(){
    console.log("llegue a eliminarPub");
    swal({
        title: "Estas seguro?",
        text: "Se reportará con los consejeros la publicación.",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            console.log("Antes del url js ");
            var url = "ReporteServlet?accion=eliminarPub";
            $.ajax({
                type: 'POST',
                url: url,
                data: {id: id},
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    location.href="MainPage.jsp";

                }
            });
            
            swal("Se ha eliminado correctamente la publicacion.", {
                icon: "success",

            });
           location.reload();
        } else {
            swal("Ok, no se borrará la publicación.");
        }
        
        
        
        
    });
}

function setId(id_d){
   id = id_d;
}