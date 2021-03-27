//Rinkeby Test Faucet: https://testnet.help/en/ethfaucet/rinkeby#log

//pragma es una palabra clave (keyword) que te permite utilizar ciertas caracteristicas de los compiladores y el ^sirve para que no compile 
//con la version 0.6 que ya puede tener cambios incompatibles con la sintaxis.
pragma solidity >=0.5.10;

//Nombre del contrato 
contract Bank {
    //variable de estado/ "state variable" 
    int bal;
    string name;
    //constructor: Metodo especial para inicializar objetos de tipo contrato; lo llamas cuando creas un objeto de tipo contrato
    constructor() public {
        bal=100;
    }
    
    //métodos o funciones
    //El modificador de funciones view indica que la funcion solo recupera un valor, no modifica su valor
    function getBalance1() public view returns(int) {
        return bal;
    }
    
    function getBalance2() public view returns(int valor) {
        valor=bal;
    }
    
    //Estas dos funciones SÍ estan cambiando el valor de nuestras variables del contrato
    function withdraw(int amt) public {
        bal = bal - amt;
    }
    
    function deposit(int amt) public {
        bal = bal + amt;
    }
}

//Ya con el codigo vamos a compilar el codigo y convertirlo en byte code

//Javascript VM y este es un ambiente local; Correrá en tu buscador 

//Ahora vamos a desplegar el código en la red de prueba Rinkeby

