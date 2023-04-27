<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Libreria_Internacional.View.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="../js/modal.js"></script>
    <title>Libreria Internacional</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Main.aspx">Libreria Internacional</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="Login.aspx">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Cart.aspx">Carrito</a>
                            </li>
                        </ul>
                        <div class="d-flex">
                            <input id="txtSearch" runat="server" class="form-control me-2" type="search" placeholder="ISBN o Título" aria-label="Buscar" />
                            <button id="btnSearch" runat="server" class="btn btn-outline-success" onserverclick="btnSearch_ServerClick">Buscar</button>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <main>
            <section class="py-5 text-center container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h1 class="fw-light">Bienvenidos!</h1>
                        <p class="lead text-muted">En nuestra biblioteca, nos enorgullece ofrecer una amplia selección de libros de alta calidad a precios accesibles. Todos nuestros libros están cuidadosamente seleccionados y mantenidos en excelentes condiciones para garantizar una experiencia de lectura satisfactoria.¡Ven y descubre las ventajas de comprar con nosotros!</p>
                    </div>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <asp:Repeater ID="repBooks" runat="server">
                    <HeaderTemplate>
                        <div class="container">
                            <div class="row row-cols-3 g-3">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="album py-5 bg-light">
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
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="Books.aspx?id=<%# Eval("Id")%>" class="btn btn-sm btn-outline-secondary">Comprar</a>
                                            <button type="button" class="btn btn-sm btn-outline-secondary">Agregar al Carrito</button>
                                        </div>
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
                <p class="float-end mb-1">
                    <a href="#">Subir</a>
                </p>
                <p class="mb-1">Informacion sobre nosotros en la parte superior de la pagina</p>
                <p class="mb-0">@Libreria Internacional</p>
            </div>
        </footer>

        <!--<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div id="offCanvaHeader" class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Login</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="card" id="cardLogin" runat="server">
                    <div class="card-body">
                        <div class="form-group">
                            <label class="form-label mt-4">Login form</label>
                            <div class="form-floating mb-3">
                                <input type="email" runat="server" class="form-control" id="txtEmail" />
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" runat="server" class="form-control" id="txtPassword" />
                                <label for="floatingPassword">Password</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button id="btnLogin" class="btn btn-primary" runat="server">Login</button>
                    </div>
                </div>
                <div hidden="hidden" id="cardUser" runat="server">
                    <div class="form-group">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <div class="row">
                                    <div class="row">
                                        <h5 id="lblName" runat="server" class="mb-1"></h5>
                                        <div class="d-flex pt-1">
                                            <button type="button" class="btn btn-outline-primary me-1 flex-grow-1">View profile</button>
                                            <button id="btnLogout" runat="server" type="button" class="btn btn-primary flex-grow-1">Logout</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->

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
    </form>
</body>
</html>
