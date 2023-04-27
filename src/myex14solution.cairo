////////////////////////////////
// ABI imports (These are the interfaces of the contracts that you will interact with)
////////////////////////////////
#[abi]
trait Iex01 {
    fn claim_points();
}

#[contract]
mod AllInOneContractByKubitus {
    ////////////////////////////////
    // Core Library imports (These are syscalls and functionalities that allow you to write starknet contracts)
    ////////////////////////////////
    use starknet::ContractAddress;
    use starknet::get_caller_address;

    ////////////////////////////////
    // Internal imports (These function become part of the set of function of the current contract)
    ////////////////////////////////
    use super::Iex01Dispatcher;
    use super::Iex01DispatcherTrait;

    ////////////////////////////////
    // Storage: In Cairo 1, storage is declared in a struct.
    // (Storage is not visible by default through the ABI)
    ////////////////////////////////
    struct Storage {
        ex01_address: ContractAddress,
        // ex02_address: ContractAddress,
        // ex03_address: ContractAddress,
        // ex04_address: ContractAddress,
        // ex05_address: ContractAddress,
        // ex05_address: ContractAddress,
        // ex06_address: ContractAddress,
        // ex07_address: ContractAddress,
        // ex08_address: ContractAddress,
        // ex09_address: ContractAddress,
        // ex10_address: ContractAddress,
        // ex10b_address: ContractAddress,
        // ex11_address: ContractAddress,
        // ex12_address: ContractAddress,
        // ex13_address: ContractAddress,
    }

    ////////////////////////////////
    // Internal functions
    // These are the interfaces of the contracts that you will interact with.
    ////////////////////////////////
    fn solve_ex01() {
        Iex01Dispatcher{contract_address: ex01_address}.claim_points();
    }

    ////////////////////////////////
    // External functions
    // These functions are callable by other contracts or external calls such as DAPP,
    // which are indicated with #[external] (similar to "public" in Solidity)
    ////////////////////////////////
    #[external]
    fn validate_various_exercises() {
        solve_ex01();
        // solve_ex02();
        // solve_ex03();
        // solve_ex04();
        // solve_ex05();
        // solve_ex06();
        // solve_ex07();
        // solve_ex08();
        // solve_ex09();
        // solve_ex10();
        // solve_ex11();
        // solve_ex12();
        // solve_ex13();
    }



}