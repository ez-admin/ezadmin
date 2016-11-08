import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Map;

/**
 * Created by Administrator on 2016/10/24.
 */
public class Ognl {

    /**
     * test for Map,Collection,String,Array isEmpty
     * @param o
     * @return
     */
    public static boolean isEmpty(Object o) throws IllegalArgumentException {
        if(o == null) return true;

        if(o instanceof String) {
            if(((String)o).length() == 0){
                return true;
            }
        } else if(o instanceof Collection) {
            if(((Collection)o).isEmpty()){
                return true;
            }
        } else if(o.getClass().isArray()) {
            if(Array.getLength(o) == 0){
                return true;
            }
        } else if(o instanceof Map) {
            if(((Map)o).isEmpty()){
                return true;
            }
        }else {
            return false;
        }

        return false;
    }

    /**
     * test for Map,Collection,String,Array isNotEmpty
     * @param 0
     * @return
     */
    public static boolean isNotEmpty(Object o) {
        return !isEmpty(o);
    }
}
