pragma solidity 0.5.0;

import "./ERC721Full.sol";

/**
 * smoothbrain We were able to import the ERC721Full contracts
 * from this local directory by using truffle-flattener
 * Not recommended for in-production builds, but is used often...
 * 
 * 
 *
 */
contract Color is ERC721Full {
	string[] public colors;
	// global variable colors is an array of strings
	// we will be able to access dif colors via indices
	mapping(string => bool) _colorExists;
	
	constructor() ERC721Full("Color", "COLOR") public { 

	}

	/**
	 * dev mint privelege should be restricted to owner.
	 * See more on minter roles on openzeppelin
	 *
	 * param string _color 
	 * Must be a unique local variable.
	 *
	 */

	function mint(string memory _color) public {
		/**
		 * 1. require unique color, no duplicates
		 * 2. Color - add it
		 * 3. Call the mint function
		 * 4. Color - track it
		 */

		 uint _id = colors.push(_color);
		 // assigns an id for every color minted
		 _mint(msg.sender, _id);
		 // calls internal mint function to msg.sender
		 _colorExists[_color] = true;



	}
}