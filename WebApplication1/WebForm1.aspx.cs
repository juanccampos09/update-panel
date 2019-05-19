using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //cargar();

            }

            
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            cargar();
        }

        private void cargar()
        {

            //DataSet vlo_DataSet = new DataSet(); // objeto que guarda todos los registros que devuelve la consulta
            //SqlConnection vlo_Conexion = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            //SqlDataAdapter vlo_dataAdapter;
            //string vlc_Sentencia = null;

            //try
            //{

            //    vlc_Sentencia = "SELECT ID, NOMBRE, TELEFONO FROM CLIENTE";


            //    // instanciando el objeto que se encarga de realizar la consulta con los paramentros de la sentencia y de la conexion a la base de datos
            //    vlo_dataAdapter = new SqlDataAdapter(vlc_Sentencia, vlo_Conexion);
            //    // llenando el dataset con los registros obtenidos de la consulta
            //    vlo_dataAdapter.Fill(vlo_DataSet, "Clientes");

            //    GridView1.DataSource = vlo_DataSet; // obteniendo los registros de la base de datos
            //    GridView1.DataBind(); // necesario para que se muestren los registros

            //}
            //catch (Exception ex)
            //{

            //    throw;

            //}
            //finally
            //{

            //    vlo_Conexion.Dispose();

            //}

        }


        private void cargar2()
        {

            DataSet vlo_DataSet = new DataSet(); // objeto que guarda todos los registros que devuelve la consulta
            SqlConnection vlo_Conexion = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            SqlDataAdapter vlo_dataAdapter;
            string vlc_Sentencia = null;

            try
            {

                vlc_Sentencia = "SELECT ID, NOMBRE, TELEFONO FROM CLIENTE";


                // instanciando el objeto que se encarga de realizar la consulta con los paramentros de la sentencia y de la conexion a la base de datos
                vlo_dataAdapter = new SqlDataAdapter(vlc_Sentencia, vlo_Conexion);
                // llenando el dataset con los registros obtenidos de la consulta
                vlo_dataAdapter.Fill(vlo_DataSet, "Clientes");

                GridView2.DataSource = vlo_DataSet; // obteniendo los registros de la base de datos
                GridView2.DataBind(); // necesario para que se muestren los registros

            }
            catch (Exception ex)
            {

                throw;

            }
            finally
            {

                vlo_Conexion.Dispose();

            }

        }

        //protected void GridView1_PreRender(object sender, EventArgs e)
        //{
        //    if (GridView1.Rows.Count > 0)
        //    {

        //        //This will add the <thead> and <tbody> elements
        //        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

        //        //This adds the <tfoot> element. 
        //        //Remove if you don't have a footer row
        //        GridView1.FooterRow.TableSection = TableRowSection.TableFooter;

        //    }
        //}

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    cargar2();
        //    ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateMsg",
        //       "window.addEventListener('DOMContentLoaded',function(){mostrarModal();});", true);

        //}

        protected void GridView2_PreRender(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count > 0)
            {

                //This will add the <thead> and <tbody> elements
                GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                GridView2.FooterRow.TableSection = TableRowSection.TableFooter;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                cargar2();
                UpdatePanel2.Update(); // volviendo a dibujar el grid con los datos obtenidos
                ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateMsg",
                "$(function(){  $(document).ready(function() { $('#Modal1').modal('show');  });});", true); // llamando una funcion anonima con jquery que tiene en su interior document ready para mostrar el modal ya que la expresion "window.addEventListener('DOMContentLoaded',function(){mostrarModal();});", true);" no ejecuta la funcion de javascript necesaria dentro de un update panel
            }
            catch (Exception)
            {
                // ocurrio un error al consultar en la base de datos
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string texto = TextBox1.Text;
            TextBox2.Text = texto;
            Image1.ImageUrl = "imagenes/lupa.png";
        }


        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    //check if the row is the header row
        //    if (e.Row.RowType == DataControlRowType.Header)
        //    {
        //        //add the thead and tbody section programatically
        //        e.Row.TableSection = TableRowSection.TableHeader;
        //    }
        //}
    }
}