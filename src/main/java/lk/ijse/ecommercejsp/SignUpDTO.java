package lk.ijse.ecommercejsp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SignUpDTO {
    private int userId;       // Maps to userId in the database
    private String userName;  // Maps to userName in the database
    private String password;  // Maps to password in the database
    private String role;      // Maps to role in the database
}
