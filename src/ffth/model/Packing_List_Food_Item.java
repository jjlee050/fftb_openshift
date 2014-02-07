package ffth.model;
public class Packing_List_Food_Item {
	private int id;
	private int quantity;
	public Food unnamed_Food_;
	public Packing_List unnamed_PackingList_;

	public Packing_List_Food_Item() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int aQuantity) {
		this.quantity = aQuantity;
	}

	public void setUnnamed_Food_(Food aUnnamed_Food_) {
		this.unnamed_Food_ = aUnnamed_Food_;
	}

	public Food getUnnamed_Food_() {
		return this.unnamed_Food_;
	}

	public void setUnnamed_PackingList_(Packing_List aUnnamed_PackingList_) {
		this.unnamed_PackingList_ = aUnnamed_PackingList_;
	}

	public Packing_List getUnnamed_PackingList_() {
		return this.unnamed_PackingList_;
	}
}