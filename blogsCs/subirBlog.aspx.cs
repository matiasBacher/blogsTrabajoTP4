using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace blogsCs
{
    public partial class subirBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void BtEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSourceBlogs.InsertParameters["texto"].DefaultValue = TextBox1.Text;
                SqlDataSourceBlogs.InsertParameters["idAutor"].DefaultValue = DropDownListAutores.SelectedValue;

                int result = SqlDataSourceBlogs.Insert();
                if (result > 0)
                {
                    LabelMensaje.Text = "Agregado " + result.ToString() + " registro.";
                    
                }
                else
                {
                    LabelMensaje.Text = "No se agregaron registros.";
                }
            }
            catch (SqlException a)
            {
                LabelMensaje.Text = "Complete todos los datos"+a.Message.ToString();
            }
        }
          
            }
        }
   