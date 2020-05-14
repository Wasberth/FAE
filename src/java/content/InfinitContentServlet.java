/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package content;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author david
 */
public class InfinitContentServlet extends HttpServlet {

    private static Integer counter = 1;

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String resp = "";
            for (int i = 1; i <= 10; i++) {
                resp += "<article class=\"container borderSimple\">\n"
                        + "                        <header class=\"row color2\">\n"
                        + "                            <div class=\"col-l2\">\n"
                        + "                                <h5 class=\"text-center\">Publicación #" + counter + ".</h5>\n"
                        + "                            </div>\n"
                        + "                        </header>\n"
                        + "                        <div class=\"row\">\n"
                        + "                            <div class=\"col-2 color2 d-none d-sm-inline-block\">\n"
                        + "                                <div class=\"btn-group-vertical btn-g\">\n"
                        + "                                    <button class=\"btn btn-success\">\n"
                        + "                                        <i class=\"fas fa-arrow-alt-circle-up\"></i>\n"
                        + "                                    </button>\n"
                        + "                                    <button class=\"btn btn-danger\">\n"
                        + "                                        <i class=\"fas fa-arrow-alt-circle-down\"></i>\n"
                        + "                                    </button>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"col-12 col-sm-10 color4\">\n"
                        + "                                <p>\n"
                        + "                                    Nam at suscipit nunc, ut ultrices nibh. Integer lacinia quam quis feugiat vulputate. Aenean lobortis interdum vehicula. Quisque egestas auctor aliquam. Integer venenatis, quam a ultrices laoreet, ante justo malesuada sapien, ut bibendum libero ipsum vitae risus. Donec vitae dolor ac eros porta hendrerit. Fusce hendrerit fringilla pretium. Morbi tincidunt nec odio a maximus. Vestibulum pretium aliquet finibus. Cras id lorem et sapien suscipit lacinia. Vivamus dignissim arcu eget ornare consequat. Cras lacinia augue ex, in tempor sem ultricies et. Mauris augue quam, aliquam in venenatis hendrerit, vestibulum aliquam ex. Sed sodales nisl nibh, eu dapibus diam tincidunt vitae. Pellentesque ac ipsum tellus. Donec auctor, velit ut placerat facilisis, tortor tellus consequat nunc, ac euismod lectus velit at nulla.\n"
                        + "\n"
                        + "                                    Integer tellus neque, ullamcorper non auctor et, fringilla ut sapien. Integer sit amet felis feugiat felis pulvinar vehicula. Curabitur vel placerat augue. Etiam hendrerit sit amet dui sed tincidunt. Cras consequat erat a metus imperdiet, et venenatis orci pretium. Etiam laoreet, ligula id aliquet lacinia, orci leo molestie neque, in luctus augue massa nec risus. Pellentesque commodo a nisi quis tincidunt. Nulla sit amet lacinia sapien. Donec sagittis et dui nec varius. Nullam orci nunc, aliquam sed ipsum et, molestie fringilla quam. Duis semper nisl sit amet malesuada condimentum. Praesent eu velit et turpis interdum eleifend ut id magna. Quisque eu arcu eu tellus placerat vehicula.\n"
                        + "                                </p>\n"
                        + "                            </div>\n"
                        + "                        </div>\n"
                        + "                        <div class=\"row d-block d-sm-none color2\">\n"
                        + "                            <div class=\"btn-group col-12 btn-g\">\n"
                        + "                                <button class=\"btn btn-light\">\n"
                        + "                                    <i class=\"fas fa-arrow-alt-circle-up\"></i>\n"
                        + "                                </button>\n"
                        + "                                <button class=\"btn btn-dark\">\n"
                        + "                                    <i class=\"fas fa-arrow-alt-circle-down\"></i>\n"
                        + "                                </button>\n"
                        + "                            </div>\n"
                        + "                        </div>\n"
                        + "                    </article>";
                counter++;
            }
            out.write(resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        counter = 1;
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        counter = 1;
        processRequest(request, response);
    }
}
