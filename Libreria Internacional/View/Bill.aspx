<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="Libreria_Internacional.View.Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="collapse bg-dark" id="navbarHeader">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-md-7 py-4">
                            <h4 class="text-white">Sobre nosotros</h4>
                            <p class="text-white">Hola! Somos la Biblioteca Internacional un espacio acogedor y multicultural ubicado en el corazón de una pequeña comunidad. Ofrecemos una amplia selección de libros y recursos digitales, así como eventos y actividades culturales para fomentar la participación de la comunidad. Somos una biblioteca sin fines de lucro sostenida por donaciones y apoyo de voluntarios.</p>
                        </div>
                        <div class="col-sm-4 offset-md-1 py-4">
                            <h4 class="text-white">Contacto</h4>
                            <ul class="list-unstyled">
                                <li><a class="text-white">+506 24168080</a></li>
                                <li><a class="text-white">@LibreriaInternacional</a></li>
                                <li><a class="text-white">libreriainternacional@info.com</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navbar navbar-dark bg-dark shadow-sm">
                <div class="container">
                    <a href="Main.aspx" class="navbar-brand d-flex align-items-center">
                        <img src="https://freesvg.org/img/1488216538.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top" />
                        <strong>Libreria Internacional</strong>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </div>
        </header>

        <asp:Repeater ID="repBill" runat="server">
            <HeaderTemplate>
                <div class="container my-5">
                    <div class="text-center">
                        <h3>Librería International</h3>
                        <h4>Sucursal San José</h4>
                    </div>
                    <hr>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="row my-4">
                    <div class="col">
                        <p>Cliente: <%# Eval("LastName")%></p>
                        <p>Nombre: <%# Eval("Name")%></p>
                    </div>
                </div>
                <div class="row my-4">
                    <div class="col">
                        <p>Titulo del libro: <%# Eval("Title")%></p>
                    </div>
                    <div class="col text-right">
                        <p>$<%# Eval("Price")%></p>
                    </div>
                </div>
                <div class="row my-4">
                    <div class="col">
                        <p>Total:</p>
                    </div>
                    <div class="col text-right">
                        <p>$<%# Eval("Total")%></p>
                    </div>
                </div>
                <div class="row my-4">
                    <div class="col">
                        <p>Cargado a la tarjeta: <%# Eval("ccNumber")%></p>
                    </div>
                    <div class="col">
                        <p>Se envía a dirección: <%# Eval("Address")%></p>
                    </div>
                </div>
                <hr>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <footer class="text-muted py-5">
            <div class="container">
                <p class="mb-1">Informacion sobre nosotros en la parte superior de la pagina</p>
                <p class="mb-0">@Libreria Internacional</p>
            </div>
        </footer>
    </form>
</body>
</html>
