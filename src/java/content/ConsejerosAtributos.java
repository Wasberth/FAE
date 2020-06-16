package content;


public class ConsejerosAtributos {
    
    private int usr_id;
    private String usr_tag;
    private String usr_pas;
    private int usr_niv;

    public ConsejerosAtributos(int usr_id, String usr_tag, String usr_pas, int usr_niv) {
        this.usr_id = usr_id;
        this.usr_tag = usr_tag;
        this.usr_pas = usr_pas;
        this.usr_niv = usr_niv;
    }

    public ConsejerosAtributos() {
    }


    

    public int getUsr_id() {
        return usr_id;
    }

    public void setUsr_id(int usr_id) {
        this.usr_id = usr_id;
    }

    public String getUsr_tag() {
        return usr_tag;
    }

    public void setUsr_tag(String usr_tag) {
        this.usr_tag = usr_tag;
    }

    public String getUsr_pas() {
        return usr_pas;
    }

    public void setUsr_pas(String usr_pas) {
        this.usr_pas = usr_pas;
    }

    public int getUsr_niv() {
        return usr_niv;
    }

    public void setUsr_niv(int usr_niv) {
        this.usr_niv = usr_niv;
    }
    
    
}
