<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultarBlogs.aspx.cs" Inherits="blogsCs.consultarBlogs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div>
    <asp:HyperLink ID="HyperLinkVolver" runat="server" NavigateUrl="~/Inicio.aspx">Volver</asp:HyperLink>
</div>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Filtrar Por Autores"></asp:Label>
        <asp:CheckBoxList ID="checkboxFiltro" runat="server" DataSourceID="SqlDataSourceAutores" DataTextField="NombreCompleto" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="checkboxFiltro_SelectedIndexChanged" >
        </asp:CheckBoxList>
        <asp:GridView ID="GridViewBlogs" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderWidth="3px" CellPadding="4" ForeColor="Black" OnRowDeleting="GridViewBlogs_RowDeleting" BorderStyle="Solid" CellSpacing="2" OnRowCancelingEdit="GridViewBlogs_RowCancelingEdit" OnRowEditing="GridViewBlogs_RowEditing" OnRowUpdating="GridViewBlogs_RowUpdating" Width="1042px">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAutores" runat="server" ConnectionString="<%$ ConnectionStrings:blogsConnectionString %>" SelectCommand="SELECT (nombre + ' ' + apellido) AS NombreCompleto, id FROM [autores]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceBlogs" runat="server" ConnectionString="<%$ ConnectionStrings:blogsConnectionString %>"  SelectCommand="SELECT blogs.id, autores_1.nombre, autores_1.apellido, blogs.texto, blogs.idAutor FROM autores AS autores_1 INNER JOIN blogs ON autores_1.id = blogs.idAutor" DeleteCommand="DELETE FROM blogs WHERE (id = @id)" UpdateCommand="UPDATE blogs SET texto = @texto WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="texto" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
