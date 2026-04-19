// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaZambia
 * @dev Registro de procesos de gelificacion vegetal y densidad de almidones.
 * Serie: Sabores de Africa (35/54)
 */
contract CulturaZambia {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 gradoGelificacion;  // Firmeza del bloque vegetal (1-10)
        uint256 nivelAlcalinidad;   // Uso de ceniza/sosa para la textura (1-5)
        bool usaCacahuete;          // Fuente de lipidos y proteinas
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Chikanda (Ingenieria de la Orquidea)
        registrarPlato(
            "Chikanda", 
            "Tuberculos de orquidea, cacahuetes molidos, ceniza de sosa, chiles.",
            "Mezcla de harina de orquidea y cacahuete cocida en agua alcalina hasta lograr una gelificacion completa tipo bloque.",
            10, 
            3, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _gel, 
        uint256 _alcalino,
        bool _mani
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_gel <= 10, "Grado de gelificacion invalido");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            gradoGelificacion: _gel,
            nivelAlcalinidad: _alcalino,
            usaCacahuete: _mani,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
