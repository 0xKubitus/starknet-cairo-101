////////////////////////////////
// ABI imports (These are the interfaces of the contracts that you will interact with)
////////////////////////////////
#[abi]
trait Iex01 {
    fn claim_points();
}

#[abi]
trait Iex02 {
    fn my_secret_value() -> u128;
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
        ex02_address: ContractAddress,
        ex03_address: ContractAddress,
        ex04_address: ContractAddress,
        ex05_address: ContractAddress,
        ex05_address: ContractAddress,
        ex06_address: ContractAddress,
        ex07_address: ContractAddress,
        ex08_address: ContractAddress,
        ex09_address: ContractAddress,
        ex10_address: ContractAddress,
        ex10b_address: ContractAddress,
        ex11_address: ContractAddress,
        ex12_address: ContractAddress,
        ex13_address: ContractAddress,
        ex14_address: ContractAddress,
    }

    #[constructor]
    fn constructor() {
        ex01_address::write(starknet::contract_address_const::<0x031d1866cb827c4e27bbca9ffee59fa2158b679413ffb58c3f90af56e1140e85>());
        ex02_address::write(starknet::contract_address_const::<0x0600f8fe0752e598b4e6b27839f00ad65215d129f385e12931323c487b6f9b36>());
        ex03_address::write(starknet::contract_address_const::<0x033d5fc40c0e262612528a9a652ada70be854d98241fb7548745262b5273c9d1>());
        ex04_address::write(starknet::contract_address_const::<0x06967cd33c6e064087123958e239c98f0de5e6d663660fa16a2526e8b115688a>());
        ex05_address::write(starknet::contract_address_const::<0x076c32e000f7112724bba3c5f51fb1290217a1010ae555e6ecbdb2bfe6613e33>());
        ex06_address::write(starknet::contract_address_const::<0x060987aea322cd12657588b6cdb0892db79322ab4533f7d74838ff2e2614a015>());
        ex07_address::write(starknet::contract_address_const::<0x006051096480f375894eebb99948bce14a84c25093636c4b4e8222cc32a67cf0>());
        ex08_address::write(starknet::contract_address_const::<0x01ec8e981b1b6a7256a71f21790dd07cafeb15d02c18534a2bd4a6c8551860aa>());
        ex09_address::write(starknet::contract_address_const::<0x053b96c4ee027c53ea001479f24c10b543063e3c26d037c600e5bd31f0b21e5c>());
        ex10_address::write(starknet::contract_address_const::<0x0763e89551900eba82d757a9f3862935cc7f7e47538f01ddba514f23d9a5f6e0>());
        ex11_address::write(starknet::contract_address_const::<0x029a9a484d22a6353eff0d60ea56c6ffabaaac5e4889182287ef1d261578b197>());
        ex12_address::write(starknet::contract_address_const::<0x04a221a8e3155fb03d1708881213a2ecdb05a41cf0ae6de83ddcf8f12bb04282>());
        ex13_address::write(starknet::contract_address_const::<0x067ed1d23c5cc3a34fb86edd4f8415250c79a374e87bcf2e6870321261ca9b0f>());
        ex14_address::write(starknet::contract_address_const::<0x031e9a701a24c1d2ecd576208087dfa52f1025072cf11e54407300f64f95ce5f>());
    }

    ////////////////////////////////
    // Internal functions
    // These are the interfaces of the contracts that you will interact with.
    ////////////////////////////////
    fn solve_ex01() {
        let ex01_addr = ex01_address::read();
        Iex01Dispatcher{contract_address: ex01_addr}.claim_points();
    }

    fn solve_ex02() {
        let ex02_secret_value = Iex02Dispatcher{contract_address: ex02_address}.my_secret_value();
        Iex02Dispatcher{ contract_address: ex02_address::read() }.claim_points(my_value: ex02_secret_value);
    }

    ////////////////////////////////
    // External functions
    // These functions are callable by other contracts or external calls such as DAPP,
    // which are indicated with #[external] (similar to "public" in Solidity)
    ////////////////////////////////
    #[external]
    fn validate_various_exercises() {
        solve_ex01();
        solve_ex02();
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