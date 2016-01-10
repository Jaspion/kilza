package ;

import org.json.*;
import java.io.Serializable;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;
import com.google.gson.annotations.Expose;

public class Obj implements Serializable
{
    private static final String FIELD_STR = "str";
    private static final String FIELD_NUM = "num";
    private static final String FIELD_FLO = "flo";
    private static final String FIELD_BOO = "boo";

    @Expose
    @SerializedName(FIELD_STR)
    private String str;
    @Expose
    @SerializedName(FIELD_NUM)
    private Long num;
    @Expose
    @SerializedName(FIELD_FLO)
    private Double flo;
    @Expose
    @SerializedName(FIELD_BOO)
    private Boolean boo;

    public Obj() {

    }

    public Obj(JSONObject jsonObject) {
        parseObject(jsonObject);
    }

    public Obj(String jsonString) {
        try {
            parseString(jsonString);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    protected void parseString(String jsonString) throws JSONException {
        JSONObject jsonObject = new JSONObject(jsonString);
        parseObject(jsonObject);
    }

    protected void parseObject(JSONObject object)
    {
        this.str = object.optString(FIELD_STR);
        this.num = object.optLong(FIELD_NUM);
        this.flo = object.optDouble(FIELD_FLO);
        this.boo = object.optBoolean(FIELD_BOO);
    }

    public void setStr(String value) {
        this.str = value;
    }

    public String getStr() {
        return this.str;
    }

    public void setNum(Long value) {
        this.num = value;
    }

    public Long getNum() {
        return this.num;
    }

    public void setFlo(Double value) {
        this.flo = value;
    }

    public Double getFlo() {
        return this.flo;
    }

    public void setBoo(Boolean value) {
        this.boo = value;
    }

    public Boolean getBoo() {
        return this.boo;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Obj) {
            return ((Obj) obj).getStr().equals(str) &&
            ((Obj) obj).getNum().equals(num) &&
            ((Obj) obj).getFlo().equals(flo) &&
            ((Obj) obj).getBoo().equals(boo) ;
        }
        return false;
    }
    @Override
    public int hashCode(){
        return (str.hashCode() +
        num.hashCode() +
        flo.hashCode() +
        boo.hashCode());
    }

    @Override
    public String toString() {
      Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
      return gson.toJson(this);
    }
}
