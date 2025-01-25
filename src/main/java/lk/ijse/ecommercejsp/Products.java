package lk.ijse.ecommercejsp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Products {
    private int productId;
    private String productName;
    private String description;
    private double price;
    private int stockQuantity;
    private int categoryId;
}
