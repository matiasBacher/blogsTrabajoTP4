<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subirBlog.aspx.cs" Inherits="blogsCs.subirBlog" %>

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
            <asp:Label ID="labelAutor" runat="server" Text="Autores"></asp:Label>
            <asp:DropDownList ID="DropDownListAutores" runat="server" DataSourceID="SqlDataSourceAutores" DataTextField="NombreCompleto" DataValueField="id">
            </asp:DropDownList>
            <br />
            <asp:Label ID="LabelTexto" runat="server" Text="Texto"></asp:Label>
        </div>
        <asp:TextBox ID="TextBox1" runat="server" Height="490px" Width="1202px" TextMode="MultiLine" ViewStateMode="Enabled"></asp:TextBox>
        <div>
            <asp:Button ID="BtEnviar" runat="server" OnClick="BtEnviar_Click" Text="Enviar " />
            <asp:Label ID="LabelMensaje" runat="server" ></asp:Label>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceAutores" runat="server" ConnectionString="<%$ ConnectionStrings:blogsConnectionString %>" SelectCommand="SELECT (nombre + ' ' + apellido) AS NombreCompleto, id FROM [autores]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceBlogs" runat="server" ConnectionString="<%$ ConnectionStrings:blogsConnectionString %>" SelectCommand="SELECT * FROM [blogs]" DeleteCommand="DELETE FROM [blogs] WHERE [id] = @id" InsertCommand="INSERT INTO [blogs] ( [texto], [idAutor]) VALUES (@texto, @idAutor)" UpdateCommand="UPDATE [blogs] SET [texto] = @texto, [idAutor] = @idAutor WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="texto" Type="String" />
                <asp:Parameter Name="idAutor" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="texto" Type="String" />
                <asp:Parameter Name="idAutor" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
