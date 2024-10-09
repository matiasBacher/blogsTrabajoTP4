using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace blogsCs
{
    public partial class gestionAutores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            string nombre = TextBoxNombre.Text;
            string apelido = TextBoxApellido.Text;

            SqlDataSource1.InsertParameters["apellido"].DefaultValue= apelido;
            SqlDataSource1.InsertParameters["nombre"].DefaultValue = nombre;
            int cantidad=SqlDataSource1.Insert();

            LabelMensaje.Text = $"Se registraron {cantidad} autor/es";
            TextBoxNombre.Text = "";
            TextBoxApellido.Text = "";
        }
    }
}