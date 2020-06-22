/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package content;

import controlador.Operaciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author david
 */
public class InfinitContentServlet extends HttpServlet {

    private static Integer counter = 0;

    public static void resetCounter() {
        counter = 0;
    }

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String resp = "";
            String counted = request.getParameter("counted");
            counter = counter + Integer.parseInt(counted);
            try {
                HttpSession session = request.getSession();
                Operaciones op = new Operaciones();
                LinkedList<Publicacion> publicaciones = ConsultaBD.getPubs();

                for (int j = 0; j < 4; j++) {
                    System.out.println(counter + j);
                    try {
                        System.out.println(publicaciones.get(j + counter));
                    } catch (Exception e) {
                        System.out.println(e);
                        System.out.println("Ya no hay publicaciones");
                        break;
                    }
                    String tit = publicaciones.get(j + counter).getTitulo();
                    String txt = publicaciones.get(j + counter).getTexto();
                    int pub_id = publicaciones.get(j + counter).getPub_id();
                    int votos = publicaciones.get(j + counter).getVotos();
                    int usr_id_pub = publicaciones.get(j + counter).getUser_id();
                    int usr_id_session = Integer.parseInt(session.getAttribute("usr_id").toString());
                    int usr_niv_session = Integer.parseInt(session.getAttribute("nivel").toString());
                    String estilo1 = publicaciones.get(j + counter).getTyp_id() == 2 ? "color6" : "color2";
                    String estilo2 = publicaciones.get(j + counter).getTyp_id() == 2 ? "color7" : "color4";
                    String etiqueta_nom = op.getEtiquetaByIdPub(pub_id);
                    String nom_usuario = op.getNombreUser(usr_id_pub);

                    out.println("<article class=\"container borderSimple\">\n"
                            + "                        <header class=\"row " + estilo1 + "\">\n"
                            + "                            <div class=\"col-l2\" style=\"padding-left:5px;\">\n"
                            + "                                <small><i class=\"fas fa-user\" style=\"color: silver;\"> " + nom_usuario + "</i></small>\n"
                            + "                                <p class=\"text-center\" style=\"margin-bottom: 3px;\">\n"
                            + "                                    <span class=\"h5\">" + tit + "</span>\n"
                            + (etiqueta_nom.equals("") ? "" : "                                    <span class=\"color5\" style=\"margin-left: 10px; padding-left:2px; \"><i class=\"fas fa-tag\"> " + etiqueta_nom + "</i></span>")
                            + "                                </p>\n"
                            + "                            </div>\n"
                            + "                        </header>\n"
                            + "                        <div class=\"modal fade\" id=\"userModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"userModalLabel\" aria-hidden=\"true\">\n"
                            + "                            <div class=\"modal-dialog\" role=\"document\">\n"
                            + "                                <div class=\"modal-content\">\n"
                            + "                                    <div class=\"modal-header\">\n"
                            + "                                        <h5 class=\"modal-title\" id=\"userModalLabel\">¿Por qué denunciar?</h5>\n"
                            + "                                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n"
                            + "                                            <span aria-hidden=\"true\">&times;</span>\n"
                            + "                                        </button>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"modal-body\">\n"
                            + "                                        <div class=\"row\">\n"
                            + "                                            <div class=\"col-4\">\n"
                            + "                                                <div class=\"list-group\" id=\"list-tab\" role=\"tablist\">\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action active\" id=\"list-home-list\" data-toggle=\"list\" href=\"#list-home\" role=\"tab\" aria-controls=\"home\">Contenido sensible</a>\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action\" id=\"list-profile-list\" data-toggle=\"list\" href=\"#list-profile\" role=\"tab\" aria-controls=\"profile\">Violencia</a>\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action\" id=\"list-messages-list\" data-toggle=\"list\" href=\"#list-messages\" role=\"tab\" aria-controls=\"messages\">Noticias falsas</a>\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action\" id=\"list-settings-list\" data-toggle=\"list\" href=\"#list-settings\" role=\"tab\" aria-controls=\"settings\">Spam</a>\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action\" id=\"list-settings-list\" data-toggle=\"list\" href=\"#list-settings\" role=\"tab\" aria-controls=\"settings\">Terrorismo</a>\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action\" id=\"list-settings-list\" data-toggle=\"list\" href=\"#list-settings\" role=\"tab\" aria-controls=\"settings\">Otro</a>\n"
                            + "                                                </div>\n"
                            + "                                            </div>\n"
                            + "                                            <div class=\"col-8\">\n"
                            + "                                                <div class=\"tab-content\" id=\"nav-tabContent\">\n"
                            + "                                                    <div class=\"tab-pane fade show active\" id=\"list-home\" role=\"tabpanel\" aria-labelledby=\"list-home-list\"><p>Velit aute mollit ipsum ad dolor consectetur nulla officia culpa adipisicing exercitation fugiat tempor. Voluptate deserunt sit sunt nisi aliqua fugiat proident ea ut. Mollit voluptate reprehenderit occaecat nisi ad non minim tempor sunt voluptate consectetur exercitation id ut nulla. Ea et fugiat aliquip nostrud sunt incididunt consectetur culpa aliquip eiusmod dolor. Anim ad Lorem aliqua in cupidatat nisi enim eu nostrud do aliquip veniam minim.</p></div>\n"
                            + "                                                    <div class=\"tab-pane fade\" id=\"list-profile\" role=\"tabpanel\" aria-labelledby=\"list-profile-list\"><p>Cupidatat quis ad sint excepteur laborum in esse qui. Et excepteur consectetur ex nisi eu do cillum ad laborum. Mollit et eu officia dolore sunt Lorem culpa qui commodo velit ex amet id ex. Officia anim incididunt laboris deserunt anim aute dolor incididunt veniam aute dolore do exercitation. Dolor nisi culpa ex ad irure in elit eu dolore. Ad laboris ipsum reprehenderit irure non commodo enim culpa commodo veniam incididunt veniam ad.</p></div>\n"
                            + "                                                    <div class=\"tab-pane fade\" id=\"list-messages\" role=\"tabpanel\" aria-labelledby=\"list-messages-list\"><p>Ut ut do pariatur aliquip aliqua aliquip exercitation do nostrud commodo reprehenderit aute ipsum voluptate. Irure Lorem et laboris nostrud amet cupidatat cupidatat anim do ut velit mollit consequat enim tempor. Consectetur est minim nostrud nostrud consectetur irure labore voluptate irure. Ipsum id Lorem sit sint voluptate est pariatur eu ad cupidatat et deserunt culpa sit eiusmod deserunt. Consectetur et fugiat anim do eiusmod aliquip nulla laborum elit adipisicing pariatur cillum.</p></div>\n"
                            + "                                                    <div class=\"tab-pane fade\" id=\"list-settings\" role=\"tabpanel\" aria-labelledby=\"list-settings-list\"><p>Irure enim occaecat labore sit qui aliquip reprehenderit amet velit. Deserunt ullamco ex elit nostrud ut dolore nisi officia magna sit occaecat laboris sunt dolor. Nisi eu minim cillum occaecat aute est cupidatat aliqua labore aute occaecat ea aliquip sunt amet. Aute mollit dolor ut exercitation irure commodo non amet consectetur quis amet culpa. Quis ullamco nisi amet qui aute irure eu. Magna labore dolor quis ex labore id nostrud deserunt dolor eiusmod eu pariatur culpa mollit in irure.</p></div>\n"
                            + "                                                    <div class=\"tab-pane fade\" id=\"list-settings\" role=\"tabpanel\" aria-labelledby=\"list-settings-list\"><p>Velit aute mollit ipsum ad dolor consectetur nulla officia culpa adipisicing exercitation fugiat tempor. Voluptate deserunt sit sunt nisi aliqua fugiat proident ea ut. Mollit voluptate reprehenderit occaecat nisi ad non minim tempor sunt voluptate consectetur exercitation id ut nulla. Ea et fugiat aliquip nostrud sunt incididunt consectetur culpa aliquip eiusmod dolor. Anim ad Lorem aliqua in cupidatat nisi enim eu nostrud do aliquip veniam minim.</p></div>\n"
                            + "                                                    <div class=\"tab-pane fade\" id=\"list-settings\" role=\"tabpanel\" aria-labelledby=\"list-settings-list\"><p>Irure enim occaecat labore sit qui aliquip reprehenderit amet velit. Deserunt ullamco ex elit nostrud ut dolore nisi officia magna sit occaecat laboris sunt dolor. Nisi eu minim cillum occaecat aute est cupidatat aliqua labore aute occaecat ea aliquip sunt amet. Aute mollit dolor ut exercitation irure commodo non amet consectetur quis amet culpa. Quis ullamco nisi amet qui aute irure eu. Magna labore dolor quis ex labore id nostrud deserunt dolor eiusmod eu pariatur culpa mollit in irure.</p></div>\n"
                            + "                                                </div>\n"
                            + "                                            </div>\n"
                            + "                                        </div>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"modal-footer\">\n"
                            + "                                        <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\n"
                            + "                                        <button type=\"button\" class=\"btn btn-primary\" onclick=\"return eliminar()\">Reportar</button>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                        <div class=\"modal fade\" id=\"eliminarModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"userModalLabel\" aria-hidden=\"true\">\n"
                            + "                            <div class=\"modal-dialog\" role=\"document\">\n"
                            + "                                <div class=\"modal-content\">\n"
                            + "                                    <div class=\"modal-header\">\n"
                            + "                                        <h5 class=\"modal-title\" id=\"userModalLabel\">¿Seguro que quieres eliminar?</h5>\n"
                            + "                                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n"
                            + "                                            <span aria-hidden=\"true\">&times;</span>\n"
                            + "                                        </button>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"modal-body\">\n"
                            + "                                        <div class=\"row\">\n"
                            + "                                            <div class=\"col-4\">\n"
                            + "                                                <div class=\"list-group\" id=\"list-tab\" role=\"tablist\">\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action active\" id=\"list-home-list\" data-toggle=\"list\" href=\"#list-home\" role=\"tab\" aria-controls=\"home\">¿Podre ver de nuevo la publicacion?</a>\n"
                            + "                                                    <a class=\"list-group-item list-group-item-action\" id=\"list-profile-list\" data-toggle=\"list\" href=\"#list-profile\" role=\"tab\" aria-controls=\"profile\">¿Puedo eliminar una publicacion que no me pertenece?</a>\n"
                            + "                                                </div>\n"
                            + "                                            </div>\n"
                            + "                                            <div class=\"col-8\">\n"
                            + "                                                <div class=\"tab-content\" id=\"nav-tabContent\">\n"
                            + "                                                    <div class=\"tab-pane fade show active\" id=\"list-home\" role=\"tabpanel\" aria-labelledby=\"list-home-list\"><p>Velit aute mollit ipsum ad dolor consectetur nulla officia culpa adipisicing exercitation fugiat tempor. Voluptate deserunt sit sunt nisi aliqua fugiat proident ea ut. Mollit voluptate reprehenderit occaecat nisi ad non minim tempor sunt voluptate consectetur exercitation id ut nulla. Ea et fugiat aliquip nostrud sunt incididunt consectetur culpa aliquip eiusmod dolor. Anim ad Lorem aliqua in cupidatat nisi enim eu nostrud do aliquip veniam minim.</p></div>\n"
                            + "                                                    <div class=\"tab-pane fade\" id=\"list-profile\" role=\"tabpanel\" aria-labelledby=\"list-profile-list\"><p>Cupidatat quis ad sint excepteur laborum in esse qui. Et excepteur consectetur ex nisi eu do cillum ad laborum. Mollit et eu officia dolore sunt Lorem culpa qui commodo velit ex amet id ex. Officia anim incididunt laboris deserunt anim aute dolor incididunt veniam aute dolore do exercitation. Dolor nisi culpa ex ad irure in elit eu dolore. Ad laboris ipsum reprehenderit irure non commodo enim culpa commodo veniam incididunt veniam ad.</p></div>\n"
                            + "                                                </div>\n"
                            + "                                            </div>\n"
                            + "                                        </div>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"modal-footer\">\n"
                            + "                                        <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Mejor no quiero eliminar</button>\n"
                            + "                                        <button type=\"button\" class=\"btn btn-primary\" onclick=\"return eliminarPub()\">Si, quiero eliminarla.</button>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                        <div class=\"row\">\n"
                            + "                            <div class=\"col-2 " + estilo1 + " d-none d-sm-inline-block\">\n"
                            + "                                <div class=\"btn-group-vertical btn-g\" style=\"margin-bottom: 3px;\">\n"
                            + "                                    <button class=\"btn btn-success\" name=\"upvote\" onclick=\"votes(" + pub_id + "," + usr_id_session + ", '+1')\">\n"
                            + "                                        <i class=\"fas fa-arrow-alt-circle-up\"></i>\n"
                            + "                                    </button>\n"
                            + "                                    <button class=\"btn disabled\">\n"
                            + "                                        <i>" + votos + "</i>\n"
                            + "                                    </button>\n"
                            + "                                    <button class=\"btn btn-danger\" name=\"downvote\" onclick=\"votes(" + pub_id + "," + usr_id_session + ", '-1')\">\n"
                            + "                                        <i class=\"fas fa-arrow-alt-circle-down\"></i>\n"
                            + "                                    </button>\n"
                            + "                                </div>\n"
                            + "                                <div class=\"btn-group-vertical btn-g\" data-toggle=\"modal\" data-target=\"#userModal\" style=\"margin-bottom: 3px;\">\n"
                            + "                                    <button type=\"button\" class=\"btn btn-secondary\" onclick=\"return setId(" + pub_id + ")\"><i class=\"far fa-flag\"></i></button>\n"
                            + "                                </div>\n"
                            + ((usr_niv_session < 3 || usr_id_session == usr_id_pub) ? "                                <div class=\"btn-group-vertical btn-g\" data-toggle=\"modal\" data-target=\"#eliminarModal\" style=\"margin-bottom: 3px;\">\n"
                                    + "                                    <button type=\"button\" class=\"btn btn-warning\" onclick=\"return setId("+pub_id+")\"><i class=\"fas fa-trash-alt\"></i></button>\n"
                                    + "                                </div>\n" : "")
                            + "                            </div>\n"
                            + "                            <div class=\"col-12 col-sm-10 " + estilo2 + "\">\n"
                            + "                                <p>\n"
                            + "                                    " + txt + "\n"
                            + "                                </p>\n"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                        <div class=\"row d-block d-sm-none " + estilo1 + "\">\n"
                            + "                            <div class=\"btn-group btn-g color-12\">\n"
                            + "                                <button class=\"btn btn-success\">\n"
                            + "                                    <i class=\"fas fa-arrow-alt-circle-up\"></i>\n"
                            + "                                </button>\n"
                            + "                                <button class=\"btn disabled\">\n"
                            + "                                    <i>" + votos + "</i>\n"
                            + "                                </button>\n"
                            + "                                <button class=\"btn btn-danger\">\n"
                            + "                                    <i class=\"fas fa-arrow-alt-circle-down\"></i>\n"
                            + "                                </button>\n"
                            + "                                <div class=\"btn-group-vertical btn-g\" data-toggle=\"modal\" data-target=\"#userModal\">\n"
                            + "                                    <button type=\"button\" class=\"btn btn-secondary\" onclick=\"return setId(" + pub_id + ")\"><i class=\"far fa-flag\"></i></button>\n"
                            + "                                </div>\n"
                            + ((usr_niv_session < 3 || usr_id_session == usr_id_pub) ? "                                <div class=\"btn-group-vertical btn-g\" data-toggle=\"modal\" data-target=\"#eliminarModal\" style=\"margin-bottom: 3px;\">\n"
                                    + "                                    <button type=\"button\" class=\"btn btn-warning\" onclick=\"return setId("+pub_id+")\"><i class=\"fas fa-trash-alt\"></i></button>\n"
                                    + "                                </div>\n" : "")
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                    </article>");
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            out.write(resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
