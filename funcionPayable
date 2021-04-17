pragma solidity >=0.5.10;

//Where are the ethers stored in payable functions?
//All the ethers sent to payable functions are owned by contract. In the above example Sample contract owns all of the ethers.

//Hay una función que es el payable fallback function, que no tiene nombre y solo puede haber una de este tipo.


contract  Sample {
    uint public balance;
    uint public lockedUntil;
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function depositMoney() public payable{
        balance += msg.value;
        lockedUntil= block.timestamp + 1 minutes;
    }
    
    //Funcion que manda dinero a la persona que mandó a llamar la función.
    function withdrawMoney() public {
        if(lockedUntil < block.timestamp) {
        
            address payable to = payable(msg.sender);
            to.transfer(getBalance());
            //**Se debe quitar el comentario de la línea siguiente para que se actualice la variable que lleva 
            //la cuenta del saldo en el contrato. El contrato tiene su propio saldo y la variable saldo solo lleva
            //la cuenta.
        
            //balance=0;
        }
        
    }
    
    //Función que va a mandar el dinero a una cuenta en específico
    //**Para esta función es importante mostrar que el gas fee se cobrará a quién llame la funcion,
    //no necesariamente a quien reciba el dinero.
    function withdrawMoneyTo(address payable _to) public {
        if(lockedUntil < block.timestamp) {
            _to.transfer(getBalance());
        }
    }
    
}
