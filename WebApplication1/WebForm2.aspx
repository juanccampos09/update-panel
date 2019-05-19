<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default" style="width: 500px; padding: 10px; margin: 10px">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab">Personal
                </a></li>
                <li><a href="#employment" aria-controls="employment" role="tab" data-toggle="tab">Employment</a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content" style="padding-top: 20px">
                <div role="tabpanel" class="tab-pane active" id="personal">
                    This is Personal Information Tab
                    <asp:Button ID="Button1" Text="Submit1" runat="server" CssClass="btn btn-primary" />
                </div>
                <div role="tabpanel" class="tab-pane" id="employment">
                    This is Employment Information Tab
                    <asp:Button ID="Button2" Text="Submit2" runat="server" CssClass="btn btn-primary" OnClick="Button2_Click"/>
                </div>
            </div>
        </div>
        
        <asp:HiddenField ID="TabName" runat="server" />
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script type="text/javascript">

        // funcion solo para cambiar el contenido que se muestra en el tab
        $(function () {

            var tabName = $("[id*=TabName]")// obteniendo el control HiddenField sin utilizar codigo del servidor. se busca un atributo que coincida con u valor, en este caso el atributo es id y el valor es el nombre del id que tiene el control
                            .val() != "" ? $("[id*=TabName]").val() : "personal"; // obteniendo el id del tab que tiene el control oculto

            $('#Tabs a[href="#' + tabName + '"]')
                .tab('show'); // mostrando el tab segun el id del tab que tiene el control oculto

            // cambiando el valor que tiene el control oculto para identificar el tab seleccionado despues del postback
            $("#Tabs a").click(function () {
                $("[id*=TabName]") // obteniendo el control HiddenField sin utilizar codigo del servidor. se busca un atributo que coincida con u valor, en este caso el atributo es id y el valor es el nombre del id que tiene el control
                    .val($(this) // obteniendo el elemento a clickeado
                        .attr("href") // obteniendo el valor del href
                        .replace("#", "") // remplazando el valor  "#nombre" por solo "nombre"
                    ); 
            });
        });
    </script>
</asp:Content>
