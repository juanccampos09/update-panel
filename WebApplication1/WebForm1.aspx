<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/jquery-ui.css" rel="stylesheet" />
    <link href="css/jquery.dataTables.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    

    
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:Button ID="Button2" runat="server" Text="obtener texto" OnClick="Button2_Click"/>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>




    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
		<asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Show Modal" />
	</ContentTemplate>
</asp:UpdatePanel>



    <!-- Modal -->
            <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <asp:GridView ID="GridView2" class="datatable table table-striped" runat="server" AutoGenerateColumns="False" OnPreRender="GridView2_PreRender" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" />
                                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
                                        <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" />
                                    </Columns>
                                </asp:GridView>


                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>



    <%-- ejemplo de internet
        
        
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />

        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%= GridView1.ClientID %>').DataTable();
            });
        </script>
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //check for a postback
            if (!Page.IsPostBack)
            {
                //bind the gridview data
                GridView1.DataSource = source;
                GridView1.DataBind();
            }
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }


        

        These few lines are all you need to get it working. You don't need the prerender event. Just bind in Page_Load in the IsPostBack check. I did add a RowDataBound event to the GridView to add the <thead> and <tbody> sections programatically rather than with jQuery.

        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />

        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%= GridView1.ClientID %>').DataTable();
            });
        </script>


        ------------------Code behind-----------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            //check for a postback
            if (!Page.IsPostBack)
            {
                //bind the gridview data
                GridView1.DataSource = source;
                GridView1.DataBind();
            }
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        --------------------UPDATE-----------------

        If you are using a DataTable inside an UpdatePanel, use the following javascript to ensure proper binding after an Async PostBack.

        <script type="text/javascript">

            var prm = Sys.WebForms.PageRequestManager.getInstance();

            prm.add_endRequest(function () {
                createDataTable();
            });

            createDataTable();

            function createDataTable() {
                $('#<%= GridView1.ClientID %>').DataTable();
            }
        </script>


        
        
    --%>
</asp:Content>

<asp:Content ID="content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>



        //$('#Button2').onclick = function(event){alert('Hello world');}; 

        function mostrarModal() {

            $('#exampleModalCenter').modal('show');

        }

        function mensaje() {

            alert('prueba');
            $('#exampleModalCenter').modal('show');
        }

    </script>


    <script>
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        if (prm != null) {

            prm.add_endRequest(function (sender, e) {

                $(document).ready(function () {
                    $('.datatable').DataTable();
                });

            })

        }
    </script>

</asp:Content>
