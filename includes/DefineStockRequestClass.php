<?php

class StockRequest {

	var $LineItems; /*array of objects of class LineDetails using the product id as the pointer */
	var $DispatchDate;
	var $Location;
	var $Department;
	var $Narrative;
	var $LineCounter=0;

	function StockRequest(){
	/*Constructor function initialises a new shopping cart */
		$this->DispatchDate = date($_SESSION['DefaultDateFormat']);
		$this->LineItems=array();
	}

	function AddLine($StockID,
					$ItemDescription,
					$Quantity,
					$UOM,
					$DecimalPlaces,
					$LineNumber=-1) {

		if ($LineNumber==-1){
			$LineNumber = $this->LineCounter;
		}
		$this->LineItems[$LineNumber]=new LineDetails($StockID,
												$ItemDescription,
												$Quantity,
												$UOM,
												$DecimalPlaces,
												$LineNumber);
		$this->LineCounter = $LineNumber + 1;
	}
}

class LineDetails {
	var $StockID;
	var $ItemDescription;
	var $Quantity;
	var $UOM;
	var $LineNumber;

	function LineDetails($StockID,
						$ItemDescription,
						$Quantity,
						$UOM,
						$DecimalPlaces,
						$LineNumber) {

		$this->LineNumber=$LineNumber;
		$this->StockID=$StockID;
		$this->ItemDescription=$ItemDescription;
		$this->Quantity=$Quantity;
		$this->DecimalPlaces=$DecimalPlaces;
		$this->UOM=$UOM;
	}

}

?>