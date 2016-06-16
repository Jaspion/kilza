/**
* Created on <%= Time.now.strftime("%Y-%m-%d") %>
* Generated by Kilza https://github.com/Jaspion/Kilza
*/
package ;

import org.json.*;
import java.io.Serializable;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;
import com.google.gson.annotations.Expose;

public class Underscore implements Serializable
{
    private static final String FIELD__ = "_";

    @Expose
    @SerializedName(FIELD__)
    private String _;

    public Underscore() {

    }

    public Underscore(JSONObject jsonObject) {
        parseObject(jsonObject);
    }

    public Underscore(String jsonString) {
        try {
            parseString(jsonString);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    protected void parseString(String jsonString) throws JSONException {
        if (!jsonString.trim().startsWith("{"))
            jsonString = "{\"" + FIELD__ + "\" : " + jsonString + "}";
        JSONObject jsonObject = new JSONObject(jsonString);
        parseObject(jsonObject);
    }

    protected void parseObject(JSONObject object)
    {
        this._ = object.optString(FIELD__);
    }

    public void set_(String value) {
        this._ = value;
    }

    public String get_() {
        return this._;
    }


    @Override
    public String toString() {
      Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
      return gson.toJson(this);
    }
}
