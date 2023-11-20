package vn.edu.iuh.backend.enums;

public enum ProductStatus {
    IN_ACTIVE(0),//đang kinh doanh
    ACTIVE(1), //tam ngung
    TERMINATED(-1); //khong ban nua
    private int value;

    ProductStatus(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
