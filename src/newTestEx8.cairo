// Core Library imports (ATTENTION: here things are imported outside of the contract, so would have to be reimported inside the contract if also needed inside the contract)
use starknet::ContractAddress;
use debug::PrintTrait;


////////////////////////////////
// ABI imports (These are the interfaces of the contracts that you will interact with)
////////////////////////////////
#[abi]
trait Iex08 {
    fn set_user_values(account: ContractAddress, values: Array::<u128>);
    fn claim_points();
}


#[contract]
mod AllInOneContractByKubitus {

    // Core Library imports (These are syscalls and functionalities that allow you to write starknet contracts)
    use starknet::get_contract_address; // (address of this current contract)
    use array::ArrayTrait;
    // Here we are importing again `starknet::ContractAddress` as it was also necessary outside of the contract (for the ABIs)
    use starknet::ContractAddress;
    // use debug::PrintTrait;


    // Internal imports (These function become part of the set of function of the current contract)
    use super::Iex08Dispatcher;
    use super::Iex08DispatcherTrait;


    ////////////////////////////////
    // Storage: In Cairo 1, storage is declared in a struct.
    // (Storage is not visible by default through the ABI)
    ////////////////////////////////
    struct Storage {
        ex08_address: ContractAddress,
        // user_array: Array::<u128>,
    }


    #[constructor]
    fn constructor() {
        ex08_address::write(starknet::contract_address_const::<0x01ec8e981b1b6a7256a71f21790dd07cafeb15d02c18534a2bd4a6c8551860aa>());
    }


    ////////////////////////////////
    // View Functions
    // Public variables should be declared explicitly with a getter function (indicated with #[view]) 
    // to be visible through the ABI and callable from other contracts or DAPP
    ////////////////////////////////
    #[view]
    fn check_ex08_address() -> ContractAddress {
        return ex08_address::read();
    }

    // #[view]
    // fn check_ex08_address() -> ContractAddress {
    //     return ex08_address::read();
    // }


    ////////////////////////////////
    // Internal functions
    // These are the interfaces of the contracts that you will interact with.
    ////////////////////////////////
    fn solve_ex08() {
        // STEP1 => create an array in which the 10th element is: '10_u128'
        // in Cairo Arrays, we can only append elements to the end of the array
        // (https://cairo-book.github.io/ch02-06-common-collections.html#array)
        let mut user_values_ex08 = ArrayTrait::new();
        user_values_ex08.append(0_u128);
        user_values_ex08.append(1_u128);
        user_values_ex08.append(2_u128);
        user_values_ex08.append(3_u128);
        user_values_ex08.append(4_u128);
        user_values_ex08.append(5_u128);
        user_values_ex08.append(6_u128);
        user_values_ex08.append(7_u128);
        user_values_ex08.append(8_u128);
        user_values_ex08.append(9_u128);
        user_values_ex08.append(10_u128); // only the 10th element needs to have a specific value
   
        // STEP2 => set_user_values()  
        let all_in_one_contract_address = get_contract_address();
        Iex08Dispatcher{contract_address: ex08_address::read()}.set_user_values(all_in_one_contract_address, user_values_ex08);
     
        // STEP3 => claim_points()
        Iex08Dispatcher{contract_address: ex08_address::read()}.claim_points();
    }
    

    ////////////////////////////////
    // External functions
    // These functions are callable by other contracts or external calls such as DAPP,
    // which are indicated with #[external] (similar to "public" in Solidity)
    ////////////////////////////////
    #[external]
    fn validate_ex08() {
        solve_ex08();
    }


  ///////////////////////////////////////////////////////////////
    //   Just adding a useless event here in order 
    //   to be able to declare this contract again but without this useless event
      #[event]
      fn Some_Useless_Event(from:ContractAddress, value:felt252) {}
      #[event]
      fn Another_Useless_Event(from:ContractAddress, value:felt252) {}
  ///////////////////////////////////////////////////////////////

}