using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace blogsCs
{
    public partial class consultarBlogs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                llenarTabla();
            }
        }
        protected List<string> conseguirFiltros()
        {


            List<string> filtros =

                checkboxFiltro.Items.Cast<ListItem>()
                .Where(filtro => filtro.Selected)
                .Select(filtro => filtro.Value)
                .ToList();

            return filtros;
        }
        
        protected void llenarTabla()
        {

            DataView dv = (DataView)SqlDataSourceBlogs.Select(DataSourceSelectArguments.Empty);

            List<string> filtros = conseguirFiltros();

            if(filtros.Count > 0)
            {
                string f = $"{string.Join(", ", conseguirFiltros())}";
                dv.RowFilter = $"idAutor IN ({f})";
            }
            if (dv.Count < 1)
            {
                GridViewBlogs.EmptyDataText = "No hay datos disponibles.";
            }

            GridViewBlogs.DataSource = dv;
            GridViewBlogs.DataBind();
  

        }

        protected void checkboxFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarTabla();
        }

        protected void GridViewBlogs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32( e.Values["id"]);

            SqlDataSourceBlogs.DeleteParameters["id"].DefaultValue = id.ToString();
            SqlDataSourceBlogs.Delete();

            llenarTabla();
        }

        protected void GridViewBlogs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int idViejo = Convert.ToInt32(GridViewBlogs.Rows[e.NewEditIndex].Cells[2].Text);
            ViewState["idViejo"] = idViejo;
            GridViewBlogs.EditIndex = e.NewEditIndex;
           
            llenarTabla();
        }

        protected void GridViewBlogs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridViewBlogs.EditIndex = -1;

            llenarTabla();

        }

  

      

        protected void GridViewBlogs_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridViewBlogs_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int)GridViewBlogs.SelectedDataKey.Values["id"];
        }

        protected void GridViewBlogs_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = (int)ViewState["idViejo"];
            string texto = Convert.ToString(e.NewValues["texto"]);

            SqlDataSourceBlogs.UpdateParameters["id"].DefaultValue = id.ToString();
            SqlDataSourceBlogs.UpdateParameters["texto"].DefaultValue = texto;
            SqlDataSourceBlogs.Update();
            GridViewBlogs.EditIndex = -1;
            llenarTabla();
        }
    }
}