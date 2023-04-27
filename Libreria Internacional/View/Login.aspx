<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Libreria_Internacional.View.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="../js/modal.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Main.aspx">Libreria Internacional</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="#offcanvasExample" data-bs-toggle="offcanvas" aria-controls="offcanvasExample">Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="vh-100" style="background-color: #808080;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" runat="server" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <h3 class="mb-5">Log in</h3>

                                <div class="form-outline mb-4">
                                    <input type="email" runat="server" id="txtEmail" value="angeldavidporras04@gmail.com" class="form-control form-control-lg" />
                                    <label class="form-label" for="txtEmail">Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" runat="server" id="txtPassword" value="Angel123" class="form-control form-control-lg" />
                                    <label class="form-label" for="txtPassword">Password</label>
                                </div>

                                <button id="btnLogin" class="btn btn-primary btn-lg btn-block" runat="server" onserverclick="btnLogin_ServerClick">Login</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div id="offCanvaHeader" class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Login</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div hidden="hidden" id="cardUser" runat="server">
                    <div class="form-group">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <div class="row align-items-center">
                                    <div class="col-12">
                                        <h5 id="lblName" runat="server" class="mb-3 text-center"></h5>
                                    </div>
                                    <div class="col-12">
                                        <button id="btnLogout" runat="server" type="button" class="btn btn-primary w-100" onserverclick="btnLogout_ServerClick">Logout</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
