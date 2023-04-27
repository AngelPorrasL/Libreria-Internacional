<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Libreria_Internacional.View.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="../js/modal.js"></script>
    <title>Carrito de Compras</title>
</head>
<body>
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

    <main>
        <div class="album py-5 bg-light">
            <asp:Repeater ID="repCart" runat="server">
                <HeaderTemplate>
                    <div class="container">
                        <div class="row row-cols-3 g-3">
                </HeaderTemplate>
                <ItemTemplate>
                    <div id="elementCard" class="card">
                        <h5 id="" class="card-title"><%# Eval("Title")%></h5>
                        <img src="<%# Eval("Photo")%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col">
                                    <section class="card-text">Nombre del comprador: <%# Eval("Name")%></section>
                                </div>
                                <div class="col">
                                    <section class="card-text">Pais del comprador: <%# Eval("Country")%></section>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <section class="card-text">Estado/Provincia: <%# Eval("State")%></section>
                                </div>
                                <div class="col">
                                    <section class="card-text">Numero de tarjeta para cancelacion del pedido: <%# Eval("ccNumber")%></section>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <h4 class="card-text">Precio del libro: $<%# Eval("Cost")%></h4>
                                </div>
                                <div class="col">
                                    <h4 class="card-text">Total incluyendo impuestos: $<%# Eval("Total")%></h4>
                                </div>
                            </div>
                            <hr />
                            <div class="row mb-3">
                                <div class="col">
                                    <button runat="server" type="button" dataid='<%# Eval("buybookId")%>' onserverclick="Unnamed_ServerClick" class="btn btn-danger">Delete</button>
                                </div>
                                <div class="col">
                                    <a href="Bill.aspx?id=<%# Eval("Id")%>&buybookId=<%# Eval("buybookId")%>" class="btn btn-success">Facturacion del pedido</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </main>

    <footer class="text-muted py-5">
        <div class="container">
            <p class="mb-1">Informacion sobre nosotros en la parte superior de la pagina</p>
            <p class="mb-0">@Libreria Internacional</p>
        </div>
    </footer>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                        <label id="lblModalTitle"></label>
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label id="lblModalMessage"></label>
                </div>
                <div class="modal-footer">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
