/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package content;

/**
 *
 * @author david
 */
public class Usuario {
    private final int usr_id;
    private final int usr_niv;
    private final String usr_tag;
    private final String usr_nom;
    private final String usr_app;
    private final String usr_apm;

    public Usuario(int usr_id, int usr_niv, String usr_tag, String usr_nom, String usr_app, String usr_apm) {
        this.usr_id = usr_id;
        this.usr_niv = usr_niv;
        this.usr_tag = usr_tag;
        this.usr_nom = usr_nom;
        this.usr_app = usr_app;
        this.usr_apm = usr_apm;
    }
    
    public int getUsr_id() {
        return usr_id;
    }

    public int getUsr_niv() {
        return usr_niv;
    }

    public String getUsr_tag() {
        return usr_tag;
    }

    public String getUsr_nom() {
        return usr_nom;
    }

    public String getUsr_app() {
        return usr_app;
    }

    public String getUsr_apm() {
        return usr_apm;
    }
    
}
