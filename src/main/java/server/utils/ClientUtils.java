package server.utils;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

public class ClientUtils {

    private static String ENCRYPTION_KEY = "45811456458114";

    public static String encryptPassword(String password) {
        try {

            byte[] bDESKey = new byte[] {(byte) 0xA0, (byte) 0xA1, (byte) 0xA2, (byte) 0xA3, (byte) 0xA4, (byte) 0xA5, (byte) 0xA6, (byte) 0xA7,
                    (byte) 0xA8, (byte) 0xA9, (byte) 0xAA, (byte) 0xAB, (byte) 0xAC, (byte) 0xAD, (byte) 0xAE, (byte) 0xAF,
                    (byte) 0xA0, (byte) 0xA1, (byte) 0xA2, (byte) 0xA3, (byte) 0xA4, (byte) 0xA5, (byte) 0xA6, (byte) 0xA7};

            SecretKeySpec DESKey = new SecretKeySpec(bDESKey, "DESede");
            Cipher crypt = Cipher.getInstance("DESede/ECB/PKCS5Padding");
            crypt.init(Cipher.ENCRYPT_MODE, DESKey);

            byte[] utf8 = password.getBytes("UTF8");
            byte[] enc = crypt.doFinal(utf8);

            // Encode bytes to base64 to get a string
            return new sun.misc.BASE64Encoder().encode(enc);
        }
        catch (BadPaddingException | IllegalBlockSizeException | InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | UnsupportedEncodingException error) {
            return (error.getMessage());
        }
    }
}
