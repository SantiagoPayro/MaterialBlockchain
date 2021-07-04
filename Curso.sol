//pragma solidity >=0.5.10;
//pragma experimental ABIEncoderv2;
pragma solidity ^0.5.17; pragma experimental ABIEncoderV2;

contract Curso {
    
    //variables de tipo private no pueden ser modificadas desde otro contrato. 
    uint balance;
    address payable[] private alumnos;
    address fabrica;
    uint x=0;
    
    modifier onlyFactory() {
        require(msg.sender == fabrica, "Necesitas hacer el contrato a traves de la fabrica");
        _;
    }
    
    constructor() public {
        fabrica=msg.sender;
        x=1;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function depositMoney() public payable {
        balance += msg.value;
    }
    
    function withdrawMoney() public onlyFactory {
        require(alumnos.length>0);
        
        uint monto=address(this).balance/alumnos.length;
        uint i=0;
        while(i<alumnos.length){
            alumnos[i].transfer(monto);
            i++;
        }
        balance=0;
    }
    
    function addPerson(address payable temporal) public {
        alumnos.push(temporal);
    }
}

contract FabricaCurso {
    
    //Relacionamos cada clave de curso con un objeto curso.
    mapping(string => Curso) cursos;
    
    function crearCurso(string memory _clave) public returns(bool) {
        Curso temp = new Curso();
        cursos[_clave] = temp;
        return true;
        
    }
    
    function existeContrato(string memory _clave) public view returns(bool) {
        address temp =0x0000000000000000000000000000000000000000;
        if(address(cursos[_clave])!=temp)
            return true;
        else
            return false;
    }
    
    function crearCursos(string[] memory _claves) public returns(uint) {
        uint i=0;
        uint x=0;
        while(i<_claves.length) {
            if(!existeContrato(_claves[i])) {
                Curso temp = new Curso();
                cursos[_claves[i]] = temp;
                x++;
            } 
            i++;
        }
        return x;
    }
    
    function buscarDireccion(string memory _clave) public view returns(address) {
        return address(cursos[_clave]);
    }
    
}
