<%-- 
    Document   : MainPage
    Created on : 7/05/2020, 11:21:11 PM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FAE</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/colors.css">
        <link rel="stylesheet" href="css/mainPage.css">
    </head>
    <body class="color5">
        <nav class="navbar navbar-expand-lg navbar-light color1 fixed-top">
            <a class="navbar-brand" href="#"><img class="logo" src="img/FAE_logo.png"></a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Menú
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Escribir una publicacion</a>
                            <a class="dropdown-item" href="#">Mi perfil</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Destacados</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <button class="btn color3 mr-sm-2" type="button">Mi perfil</button>
                </form>
            </div>
        </nav>
        <div id="content-box" class="container-fluid content">
            <div class="row">
                <aside class="col-3 px-1 position-fixed offset-8 d-none d-sm-inline-block color3" id="sticky-sidebar">
                    <br>
                    <h4>Noticia destacada 1</h4><br>
                    <h4>Noticia destacada 2</h4><br>
                    <h4>Noticia destacada 3</h4><br>
                </aside>
            </div>
            <div class="row">
                <aside class="col-3 px-1 position-fixed offset-8 d-none d-sm-inline-block color3 aside2" id="sticky-sidebar">
                    <br>
                    <p>Información de la pag</p>
                    <p>Términos de uso blablabla</p>
                </aside>
            </div>
            <div class="row">
                <div id="content-wrapper" class="col-10 col-sm-7 offset-1">

                    <!--Este artículo es obligatorio-->
                    <article class="container borderSimple d-none d-sm-inline-block">
                        <a href="publication.jsp">
                            <div class="row">
                                <div class="col-sm-2 color2 btn-group btn-g">
                                    <button class="btn">
                                        <i class="fas fa-pencil-alt"></i>
                                    </button>
                                </div>
                                <div class="col-sm-10 color4 form-control">
                                    Escribir una publicacion
                                </div>
                            </div>
                        </a>
                    </article>
                    <!--Este artículo es obligatorio-->

                    <!--Primeros 2-5 artículos deben de ser generados por ESTE jsp-->
                    <article class="container borderSimple">
                        <header class="row color2">
                            <div class="col-l2">
                                <h5 class="text-center">Center aligned text on all viewport sizes.</h5>
                            </div>
                        </header>
                        <div class="row">
                            <div class="col-2 color2">
                                <div class="btn-group-vertical btn-g">
                                    <button class="btn btn-success">
                                        <i class="fas fa-arrow-alt-circle-up"></i>
                                    </button>
                                    <button class="btn btn-danger">
                                        <i class="fas fa-arrow-alt-circle-down"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-10 color4">
                                <p>
                                    Nam at suscipit nunc, ut ultrices nibh. Integer lacinia quam quis feugiat vulputate. Aenean lobortis interdum vehicula. Quisque egestas auctor aliquam. Integer venenatis, quam a ultrices laoreet, ante justo malesuada sapien, ut bibendum libero ipsum vitae risus. Donec vitae dolor ac eros porta hendrerit. Fusce hendrerit fringilla pretium. Morbi tincidunt nec odio a maximus. Vestibulum pretium aliquet finibus. Cras id lorem et sapien suscipit lacinia. Vivamus dignissim arcu eget ornare consequat. Cras lacinia augue ex, in tempor sem ultricies et. Mauris augue quam, aliquam in venenatis hendrerit, vestibulum aliquam ex. Sed sodales nisl nibh, eu dapibus diam tincidunt vitae. Pellentesque ac ipsum tellus. Donec auctor, velit ut placerat facilisis, tortor tellus consequat nunc, ac euismod lectus velit at nulla.

                                    Integer tellus neque, ullamcorper non auctor et, fringilla ut sapien. Integer sit amet felis feugiat felis pulvinar vehicula. Curabitur vel placerat augue. Etiam hendrerit sit amet dui sed tincidunt. Cras consequat erat a metus imperdiet, et venenatis orci pretium. Etiam laoreet, ligula id aliquet lacinia, orci leo molestie neque, in luctus augue massa nec risus. Pellentesque commodo a nisi quis tincidunt. Nulla sit amet lacinia sapien. Donec sagittis et dui nec varius. Nullam orci nunc, aliquam sed ipsum et, molestie fringilla quam. Duis semper nisl sit amet malesuada condimentum. Praesent eu velit et turpis interdum eleifend ut id magna. Quisque eu arcu eu tellus placerat vehicula.
                                </p>
                            </div>
                        </div>
                    </article>
                    <article class="container borderSimple">
                        <header class="row color2">
                            <div class="col-l2">
                                <p class="text-center">Center aligned text on all viewport sizes.</p>
                            </div>
                        </header>
                        <div class="row">
                            <div class="col-2 color2">
                                <div class="btn-group-vertical btn-g">
                                    <button class="btn btn-success">
                                        <i class="fas fa-arrow-alt-circle-up"></i>
                                    </button>
                                    <button class="btn btn-danger">
                                        <i class="fas fa-arrow-alt-circle-down"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-10 color4">
                                <p>
                                    Nam at suscipit nunc, ut ultrices nibh. Integer lacinia quam quis feugiat vulputate. Aenean lobortis interdum vehicula. Quisque egestas auctor aliquam. Integer venenatis, quam a ultrices laoreet, ante justo malesuada sapien, ut bibendum libero ipsum vitae risus. Donec vitae dolor ac eros porta hendrerit. Fusce hendrerit fringilla pretium. Morbi tincidunt nec odio a maximus. Vestibulum pretium aliquet finibus. Cras id lorem et sapien suscipit lacinia. Vivamus dignissim arcu eget ornare consequat. Cras lacinia augue ex, in tempor sem ultricies et. Mauris augue quam, aliquam in venenatis hendrerit, vestibulum aliquam ex. Sed sodales nisl nibh, eu dapibus diam tincidunt vitae. Pellentesque ac ipsum tellus. Donec auctor, velit ut placerat facilisis, tortor tellus consequat nunc, ac euismod lectus velit at nulla.

                                    Integer tellus neque, ullamcorper non auctor et, fringilla ut sapien. Integer sit amet felis feugiat felis pulvinar vehicula. Curabitur vel placerat augue. Etiam hendrerit sit amet dui sed tincidunt. Cras consequat erat a metus imperdiet, et venenatis orci pretium. Etiam laoreet, ligula id aliquet lacinia, orci leo molestie neque, in luctus augue massa nec risus. Pellentesque commodo a nisi quis tincidunt. Nulla sit amet lacinia sapien. Donec sagittis et dui nec varius. Nullam orci nunc, aliquam sed ipsum et, molestie fringilla quam. Duis semper nisl sit amet malesuada condimentum. Praesent eu velit et turpis interdum eleifend ut id magna. Quisque eu arcu eu tellus placerat vehicula.
                                </p>
                            </div>
                        </div>
                    </article>
                    <!--Primeros 2-5 artículos deben de ser generados por ESTE jsp-->
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(window).scroll(function () {
                    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                        $.get("InfinitContentServlet", function (data) {
                            $("#content-wrapper").append(data);
                        });
                    }
                });
            });
        </script>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Menú
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Escribir una publicacion</a>
                            <a class="dropdown-item" href="#">Mi perfil</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Destacados</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <button class="btn color3 mr-sm-2" type="button">Mi perfil</button>
                </form>
            </div>
        </nav>
        <div class="container-fluid content">
            <div class="row">
                <aside class="col-3 px-1 position-fixed offset-8 d-none d-sm-inline-block color3" id="sticky-sidebar">
                    <br>
                    <h4>Noticia destacada 1</h4><br>
                    <h4>Noticia destacada 2</h4><br>
                    <h4>Noticia destacada 3</h4><br>
                </aside>
            </div>
            <div class="row">
                <aside class="col-3 px-1 position-fixed offset-8 d-none d-sm-inline-block color3 aside2" id="sticky-sidebar">
                    <br>
                    <p>Información de la pag</p>
                    <p>Términos de uso blablabla</p>
                </aside>
            </div>
            <div class="row">
                <div class="col-10 col-sm-7 offset-1" id="main">
                    <article class="container borderSimple d-none d-sm-inline-block">
                        <a>
                            <div class="row">
                                <div class="col-sm-2 color2 btn-group btn-g">
                                    <button class="btn">
                                        <i class="fas fa-pencil-alt"></i>
                                    </button>
                                </div>
                                <div class="col-sm-10 color4 form-control">
                                    Escribir una publicacion
                                </div>
                            </div>
                        </a>
                    </article>
                    <article class="container borderSimple">
                        <header class="row color2">
                            <div class="col-l2">
                                <p class="text-center">Center aligned text on all viewport sizes.</p>
                            </div>
                        </header>
                        <div class="row">
                            <div class="col-2 color2 d-none d-sm-inline-block">
                                <div class="btn-group-vertical btn-g">
                                    <button class="btn btn-light">
                                        <i class="fas fa-arrow-alt-circle-up"></i>
                                    </button>
                                    <button class="btn btn-dark">
                                        <i class="fas fa-arrow-alt-circle-down"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-12 col-sm-10 color4">
                                <p>
                                    Nam at suscipit nunc, ut ultrices nibh. Integer lacinia quam quis feugiat vulputate. Aenean lobortis interdum vehicula. Quisque egestas auctor aliquam. Integer venenatis, quam a ultrices laoreet, ante justo malesuada sapien, ut bibendum libero ipsum vitae risus. Donec vitae dolor ac eros porta hendrerit. Fusce hendrerit fringilla pretium. Morbi tincidunt nec odio a maximus. Vestibulum pretium aliquet finibus. Cras id lorem et sapien suscipit lacinia. Vivamus dignissim arcu eget ornare consequat. Cras lacinia augue ex, in tempor sem ultricies et. Mauris augue quam, aliquam in venenatis hendrerit, vestibulum aliquam ex. Sed sodales nisl nibh, eu dapibus diam tincidunt vitae. Pellentesque ac ipsum tellus. Donec auctor, velit ut placerat facilisis, tortor tellus consequat nunc, ac euismod lectus velit at nulla.

                                    Integer tellus neque, ullamcorper non auctor et, fringilla ut sapien. Integer sit amet felis feugiat felis pulvinar vehicula. Curabitur vel placerat augue. Etiam hendrerit sit amet dui sed tincidunt. Cras consequat erat a metus imperdiet, et venenatis orci pretium. Etiam laoreet, ligula id aliquet lacinia, orci leo molestie neque, in luctus augue massa nec risus. Pellentesque commodo a nisi quis tincidunt. Nulla sit amet lacinia sapien. Donec sagittis et dui nec varius. Nullam orci nunc, aliquam sed ipsum et, molestie fringilla quam. Duis semper nisl sit amet malesuada condimentum. Praesent eu velit et turpis interdum eleifend ut id magna. Quisque eu arcu eu tellus placerat vehicula.
                                </p>
                            </div>
                        </div>
                        <div class="row d-block d-sm-none color2">
                            <div class="btn-group col-12 btn-g">
                                <button class="btn btn-light">
                                    <i class="fas fa-arrow-alt-circle-up"></i>
                                </button>
                                <button class="btn btn-dark">
                                    <i class="fas fa-arrow-alt-circle-down"></i>
                                </button>
                            </div>
                        </div>
                    </article>
                    <article class="container borderSimple">
                        <header class="row color2">
                            <div class="col-l2">
                                <p class="text-center">Center aligned text on all viewport sizes.</p>
                            </div>
                        </header>
                        <div class="row">
                            <div class="col-2 color2">
                                <div class="btn-group-vertical btn-g">
                                    <button class="btn btn-success">
                                        <i class="fas fa-arrow-alt-circle-up"></i>
                                    </button>
                                    <button class="btn btn-danger">
                                        <i class="fas fa-arrow-alt-circle-down"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-10 color4">
                                <p>
                                    Nam at suscipit nunc, ut ultrices nibh. Integer lacinia quam quis feugiat vulputate. Aenean lobortis interdum vehicula. Quisque egestas auctor aliquam. Integer venenatis, quam a ultrices laoreet, ante justo malesuada sapien, ut bibendum libero ipsum vitae risus. Donec vitae dolor ac eros porta hendrerit. Fusce hendrerit fringilla pretium. Morbi tincidunt nec odio a maximus. Vestibulum pretium aliquet finibus. Cras id lorem et sapien suscipit lacinia. Vivamus dignissim arcu eget ornare consequat. Cras lacinia augue ex, in tempor sem ultricies et. Mauris augue quam, aliquam in venenatis hendrerit, vestibulum aliquam ex. Sed sodales nisl nibh, eu dapibus diam tincidunt vitae. Pellentesque ac ipsum tellus. Donec auctor, velit ut placerat facilisis, tortor tellus consequat nunc, ac euismod lectus velit at nulla.

                                    Integer tellus neque, ullamcorper non auctor et, fringilla ut sapien. Integer sit amet felis feugiat felis pulvinar vehicula. Curabitur vel placerat augue. Etiam hendrerit sit amet dui sed tincidunt. Cras consequat erat a metus imperdiet, et venenatis orci pretium. Etiam laoreet, ligula id aliquet lacinia, orci leo molestie neque, in luctus augue massa nec risus. Pellentesque commodo a nisi quis tincidunt. Nulla sit amet lacinia sapien. Donec sagittis et dui nec varius. Nullam orci nunc, aliquam sed ipsum et, molestie fringilla quam. Duis semper nisl sit amet malesuada condimentum. Praesent eu velit et turpis interdum eleifend ut id magna. Quisque eu arcu eu tellus placerat vehicula.
                                </p>
                            </div>
                        </div>
                    </article>
                    <article class="container borderSimple">
                        <header class="row color2">
                            <div class="col-l2">
                                <p class="text-center">Center aligned text on all viewport sizes.</p>
                            </div>
                        </header>
                        <div class="row">
                            <div class="col-2 color2">
                                <div class="btn-group-vertical btn-g">
                                    <button class="btn btn-success">
                                        <i class="fas fa-arrow-alt-circle-up"></i>
                                    </button>
                                    <button class="btn btn-danger">
                                        <i class="fas fa-arrow-alt-circle-down"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-10 color4">
                                <p>
                                    Nam at suscipit nunc, ut ultrices nibh. Integer lacinia quam quis feugiat vulputate. Aenean lobortis interdum vehicula. Quisque egestas auctor aliquam. Integer venenatis, quam a ultrices laoreet, ante justo malesuada sapien, ut bibendum libero ipsum vitae risus. Donec vitae dolor ac eros porta hendrerit. Fusce hendrerit fringilla pretium. Morbi tincidunt nec odio a maximus. Vestibulum pretium aliquet finibus. Cras id lorem et sapien suscipit lacinia. Vivamus dignissim arcu eget ornare consequat. Cras lacinia augue ex, in tempor sem ultricies et. Mauris augue quam, aliquam in venenatis hendrerit, vestibulum aliquam ex. Sed sodales nisl nibh, eu dapibus diam tincidunt vitae. Pellentesque ac ipsum tellus. Donec auctor, velit ut placerat facilisis, tortor tellus consequat nunc, ac euismod lectus velit at nulla.

                                    Integer tellus neque, ullamcorper non auctor et, fringilla ut sapien. Integer sit amet felis feugiat felis pulvinar vehicula. Curabitur vel placerat augue. Etiam hendrerit sit amet dui sed tincidunt. Cras consequat erat a metus imperdiet, et venenatis orci pretium. Etiam laoreet, ligula id aliquet lacinia, orci leo molestie neque, in luctus augue massa nec risus. Pellentesque commodo a nisi quis tincidunt. Nulla sit amet lacinia sapien. Donec sagittis et dui nec varius. Nullam orci nunc, aliquam sed ipsum et, molestie fringilla quam. Duis semper nisl sit amet malesuada condimentum. Praesent eu velit et turpis interdum eleifend ut id magna. Quisque eu arcu eu tellus placerat vehicula.
                                </p>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
