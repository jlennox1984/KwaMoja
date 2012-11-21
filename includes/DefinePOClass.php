<?php
/* $Id$ */
/* Definition of the PurchOrder class to hold all the information for a purchase order and delivery
*/


class PurchOrder {

	var $LineItems; /*array of objects of class LineDetails using the product id as the pointer */
	var $CurrCode;
	var $CurrDecimalPlaces;
	var $ExRate;
	var $Initiator;
	var $DeliveryDate;
	var $RequisitionNo;
	var $DelAdd1;
	var $DelAdd2;
	var $DelAdd3;
	var $DelAdd4;
	var $DelAdd5;
	var $DelAdd6;
	var $Tel;
	var $SuppDelAdd1;
	var $SuppDelAdd2;
	var $SuppDelAdd3;
	var $SuppDelAdd4;
	var $SuppDelAdd5;
	var $SuppDelAdd6;
	var $SupplierContact;
	var $SuppTel;
	var $Comments;
	var $Location;
	var $Managed;
	var $SupplierID;
	var $SupplierName;
	var $Orig_OrderDate;
	var $OrderNo; /*Only used for modification of existing orders otherwise only established when order committed */
	var $LinesOnOrder;
	var $PrintedPurchaseOrder;
	var $DatePurchaseOrderPrinted;
	var $Total;
	var $GLLink; /*Is the GL link to stock activated only checked when order initiated or reading in for modification */
	var $Version;
	var $Status;
	var $StatusComments;
	var $AllowPrintPO;
	var $Revised;
	var $DeliveryBy;
	var $PaymentTerms;
	var $Contact;
	var $Port;

	function PurchOrder(){
	/*Constructor function initialises a new purchase order object */
		$this->LineItems = array();
		$this->total=0;
		$this->LinesOnOrder=0;
	}

	function add_to_order($LineNo,
						$StockID,
						$Serialised,
						$Controlled,
						$Qty,
						$ItemDescr,
						$Price,
						$UOM,
						$GLCode,
						$ReqDelDate,
						$ShiptRef,
						$Completed,
						$JobRef,
						$QtyInv=0,
						$QtyRecd=0,
						$GLActName='',
						$DecimalPlaces=2,
						$SuppliersUnit,
						$ConversionFactor=1,
						$LeadTime=1,
						$Suppliers_PartNo='',
						$AssetID=0){

		if ($Qty!=0 and isset($Qty)){

			$this->LineItems[$LineNo] = new LineDetails($LineNo,
													$StockID,
													$Serialised,
													$Controlled,
													$Qty,
													$ItemDescr,
													$Price,
													$UOM,
													$GLCode,
													$ReqDelDate,
													$ShiptRef,
													$Completed,
													$JobRef,
													$QtyInv,
													$QtyRecd,
													$GLActName,
													$DecimalPlaces,
													$SuppliersUnit,
													$ConversionFactor,
													$LeadTime,
													$Suppliers_PartNo,
													$AssetID);
			$this->LinesOnOrder++;
			return 1;
		}
		return 0;
	}

	function update_order_item($LineNo,
								$Qty,
								$Price,
								$ItemDescription,
								$GLCode,
								$GLAccountName,
								$ReqDelDate,
								$ShiptRef,
								$JobRef ,
								$SuppliersUnit,
								$ConversionFactor,
								$Suppliers_PartNo){

			$this->LineItems[$LineNo]->ItemDescription = $ItemDescription;
			$this->LineItems[$LineNo]->Quantity = $Qty;
			$this->LineItems[$LineNo]->Price = $Price;
			$this->LineItems[$LineNo]->GLCode = $GLCode;
			$this->LineItems[$LineNo]->GLAccountName = $GLAccountName;
			$this->LineItems[$LineNo]->ReqDelDate = $ReqDelDate;
			$this->LineItems[$LineNo]->ShiptRef = $ShiptRef;
			$this->LineItems[$LineNo]->JobRef = $JobRef;
			$this->LineItems[$LineNo]->SuppliersUnit = $SuppliersUnit;
			$this->LineItems[$LineNo]->ConversionFactor = $ConversionFactor;
			$this->LineItems[$LineNo]->Suppliers_PartNo = $Suppliers_PartNo;
	}

	function remove_from_order(&$LineNo){
		 $this->LineItems[$LineNo]->Deleted = True;
		 $this->LinesOnOrder--;
	}


	function Any_Already_Received(){
		/* Checks if there have been deliveries or invoiced entered against any of the line items */
		if (count($this->LineItems)>0){
		   foreach ($this->LineItems as $OrderedItems) {
			if ($OrderedItems->QtyReceived !=0 or $OrderedItems->QtyInv !=0){
				return 1;
			}
		   }
		}
		return 0;
	}

	function Any_Lines_On_A_Shipment(){
		/* Checks if any of the line items are on a shipment */
		if (count($this->LineItems)>0){
		   foreach ($this->LineItems as $OrderedItems) {
			if ($OrderedItems->ShiptRef !=''){
				return $OrderedItems->ShiptRef;
			}
		   }
		}
		return 0;
	}
	function Some_Already_Received($LineNo){
		/* Checks if there have been deliveries or amounts invoiced against a specific line item */
		if (count($this->LineItems)>0 and isset($this->LineItems[$LineNo])){
		   if ($this->LineItems[$LineNo]->QtyReceived !=0 or $this->LineItems[$LineNo]->QtyInv !=0){
			return 1;
		   }
		}
		return 0;
	}

	function Order_Value() {
		$TotalValue=0;
		foreach ($this->LineItems as $OrderedItems) {
			if ($OrderedItems->Deleted == False){
				$TotalValue += ($OrderedItems->Price)*($OrderedItems->Quantity);
			}
		}
		return $TotalValue;
	}

	function AllLinesReceived(){
		foreach ($this->LineItems as $OrderedItems) {
			if (($OrderedItems->QtyReceived + $OrderedItems->ReceiveQty) < $OrderedItems->Quantity){
				return 0;
			}
		}
		return 1; //all lines must be fully received
	}

	function SomethingReceived(){
		foreach ($this->LineItems as $OrderedItems) {
			if ($OrderedItems->ReceiveQty !=0){
				return 1;
			}
		}
		return 0; //nowt received
	}

} /* end of class defintion */

class LineDetails {
/* PurchOrderDetails */
	var $LineNo;
	var $PODetailRec;
	var $StockID;
	var $ItemDescription;
	var $DecimalPlaces;
	var $GLCode;
	var $GLActName;
	var $Quantity;
	var $Price;
	var $Units;
	var $ReqDelDate;
	var $QtyInv;
	var $QtyReceived;
	var $StandardCost;
	var $ShiptRef;
	var $Completed;
	var $JobRef;
	var $ConversionFactor;
	var $SuppliersUnit;
	var $Suppliers_PartNo;
	var $LeadTime;
	var $ReceiveQty; //this receipt of stock
	var $Deleted;
	var $Controlled;
	var $Serialised;
	var $SerialItems;  /*An array holding the batch/serial numbers and quantities in each batch*/
	var $AssetID;

	function LineDetails (	$LineNo,
						$StockItem,
						$Serialised,
						$Controlled,
						$Qty,
						$ItemDescr,
						$Price,
						$UOM,
						$GLCode,
						$ReqDelDate,
						$ShiptRef =0,
						$Completed,
						$JobRef,
						$QtyInv,
						$QtyRecd,
						$GLActName,
						$DecimalPlaces,
						$SuppliersUnit,
						$ConversionFactor,
						$LeadTime,
						$Suppliers_PartNo,
						$AssetID)	{

	/* Constructor function to add a new LineDetail object with passed params */
		$this->LineNo = $LineNo;
		$this->StockID =$StockItem;
		$this->Controlled = $Controlled;
		$this->Serialised = $Serialised;
		$this->DecimalPlaces=$DecimalPlaces;
		$this->ItemDescription = $ItemDescr;
		$this->Quantity = $Qty;
		$this->ReqDelDate = $ReqDelDate;
		$this->Price = $Price;
		$this->Units = $UOM;
		$this->QtyReceived = $QtyRecd;
		$this->QtyInv = $QtyInv;
		$this->GLCode = $GLCode;
		$this->JobRef = $JobRef;
		$this->SuppliersUnit = $SuppliersUnit;
		$this->ConversionFactor = $ConversionFactor;
		$this->Suppliers_PartNo = $Suppliers_PartNo;
		$this->LeadTime = $LeadTime;
		if (is_numeric($ShiptRef)){
			$this->ShiptRef = $ShiptRef;
		} else {
			$this->ShiptRef = 0;
		}
		$this->Completed = $Completed;
		$this->GLActName = $GLActName;
		$this->ReceiveQty = 0;	/*initialise these last two only */
		$this->StandardCost = 0;
		$this->Deleted = false;
		$this->SerialItems = array(); /*if Controlled then need to populate this later */
		$this->SerialItemsValid=false;
		$this->AssetID = $AssetID;

	}
}
?>