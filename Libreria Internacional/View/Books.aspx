<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Libreria_Internacional.View.Books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="../js/modal.js"></script>
    <title>Compra de libros</title>
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
        <main>

            <div class="album py-5 bg-light">
                <asp:Repeater ID="repBooks" runat="server">
                    <HeaderTemplate>
                        <div class="container">
                            <div class="row row-cols-3 g-3">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="container d-flex justify-content-center">
                            <div id="elementCard" class="card shadow-sm mx-auto">
                                <img src="<%# Eval("Photo")%>" class="card-img-top" width="420" height="584">
                                <div class="card-body text-center">
                                    <p class="card-text">
                                        ISBN: <%# Eval("ISBN")%>
                                        <br />
                                        Titulo: <%# Eval("Title")%>
                                        <br />
                                        Autor: <%# Eval("Autor")%>
                                        <br />
                                        Fecha de publicación: <%# Eval("Publication")%>
                                        <br />
                                        Precio: <strong>$<%# Eval("Price")%></strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                        </div>
                </div>
            <br />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4 order-md-2 mb-4">
                                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                                        <span class="text-muted">Carrito</span>
                                        <span class="badge badge-secondary badge-pill">3</span>
                                    </h4>
                                    <ul class="list-group mb-3 sticky-top">
                                        <li class="list-group-item d-flex justify-content-between lh-condensed" runat="server">
                                            <div>
                                                <h6 class="my-0"><%# Eval("Title")%></h6>
                                                <small class="text-muted"><%# Eval("Autor")%></small>
                                            </div>
                                            <span class="text-muted">$<label id="lblPrice" runat="server"></label></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between">
                                            <span>Cost</span>
                                            <label id="lblCost" runat="server"></label>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between">
                                            <span>Tax</span>
                                            <span>$10</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between">
                                            <span>Total (USD)</span>
                                            <strong>
                                                <label id="lblTotal" runat="server"></label>
                                            </strong>
                                        </li>
                                    </ul>
                                </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Pago</h4>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name">Nombre</label>
                            <input type="text" class="form-control" id="name" runat="server" placeholder="" value="" required="" />
                            <div class="invalid-feedback">Su nombre es requerido para la compra </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Apellido</label>
                            <input type="text" class="form-control" id="lastName" runat="server" placeholder="" value="" required="" />
                            <div class="invalid-feedback">Su apellido es requerido para la compra </div>
                        </div>
                    </div>
                    <!--<div class="mb-3">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" runat="server" placeholder="nombre@gmail.com" />
                            <div class="invalid-feedback">Escriba un email valido para validar su compra </div>
                        </div>-->
                    <div class="mb-3">
                        <label for="address">Direccion</label>
                        <input type="text" class="form-control" id="address" runat="server" placeholder="" required="" />
                        <div class="invalid-feedback">Escriba una direccion para enviar su pedido </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 mb-3">
                            <label for="country">Pais</label>
                            <select class="custom-select d-block w-100" id="country" runat="server" required="">
                                <option value="">Elige...</option>
                                <option>Costa Rica</option>
                                <option>Colombia</option>
                                <option>Mexico</option>
                                <option>Argentina</option>
                                <option>Estados Unidos</option>
                            </select>
                            <div class="invalid-feedback">Selecciona un pais </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="state">State</label>
                            <input type="text" class="form-control" id="state" runat="server" placeholder="" required="" />
                            <div class="invalid-feedback">Escribe una provincia/estado </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="zip">Codigo postal</label>
                            <input type="number" class="form-control" id="zip" runat="server" placeholder="" required="" />
                            <div class="invalid-feedback">Codigo postal requerido </div>
                        </div>
                    </div>
                    <hr class="mb-4" />
                    <h4 class="mb-3">Tarjeta</h4>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="ccnumber">Numero de tarjeta</label>
                            <input type="number" class="form-control" id="ccnumber" runat="server" placeholder="" required="" />
                            <div class="invalid-feedback">Numero de tarjeta requerido </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="ccexpiration">Fecha de expiracion</label>
                            <input type="text" class="form-control" id="ccexpiration" runat="server" placeholder="12-30-2035" required="" />
                            <div class="invalid-feedback">Fecha de expiracion </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="securitycode">Codigo de seguridad</label>
                            <input type="number" class="form-control" id="securitycode" runat="server" placeholder="" required="" />
                            <div class="invalid-feedback">Codigo de seguridad requerido </div>
                        </div>
                    </div>
                    <button id="btnSave" class="btn btn-primary" runat="server" onserverclick="btnSave_ServerClick">Guardar</button>
                </div>
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
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
