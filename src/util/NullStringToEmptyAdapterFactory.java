package util;

import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.reflect.TypeToken;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class NullStringToEmptyAdapterFactory<T> implements TypeAdapterFactory {
    @Override
    public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
        Class<T> rawType = (Class<T>) typeToken.getRawType();
        if (rawType != String.class) {
            return null;        }
        return (TypeAdapter<T>) new StringNullAdapter();
    }
}
