// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract estudiantes{

    string private _Nombre;
    string private _Apellido;
    string private _Curso;
    address private _Docente;
    mapping(string => uint) private _NotaMateria;
    string[] private _Materias;

    constructor(string memory Nombre_, string memory Apellido_, string memory Curso_){
        _Nombre = Nombre_;
        _Apellido = Apellido_;
        _Curso = Curso_;
        _Docente = msg.sender;
    }

    function nombre_completo() public view returns(string memory){
        return string.concat(_Nombre, " ", _Apellido);
    }

    function apellido() public view returns(string memory){
        return _Apellido;
    }

    function curso() public view returns(string memory){
        return _Curso;
    }

    function set_nota_materia(string memory materia , uint Nota) public{
        require(msg.sender == _Docente, "Solamente el docente puede modificar el valor");
        _NotaMateria[materia] = Nota;
        _Materias.push(materia);

    }

    function nota_materia(string memory materia)public view returns(uint){
        return _NotaMateria[materia];
 
    }

    function aprobo(string memory materia)public view returns(bool){
        if (_NotaMateria[materia] >= 60 && _NotaMateria[materia] <= 100) {
            return true; 
            } 
            else { 
            return false;
        }
    }

    function promedio()public view returns(uint)
    {
    uint _promedio = 0;

    for(uint i = 0; i < _Materias.length ; i++)
    {
         _promedio += _notas_materias[_Materias[i]];


    }
    return _promedio / _Materias.length;
    }
}