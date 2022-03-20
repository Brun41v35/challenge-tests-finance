import Foundation

final class LoginPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: LoginPresenterOutputProtocol?
    private let router: LoginRouterProtocol
    private let interactor: LoginInteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(
        router: LoginRouterProtocol,
        interactor: LoginInteractorInputProtocol
    ) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    private func validateData(email: String, password: String) -> (isvalid: Bool, message: String) {
        guard email.isValidEmail() else {
            return (false, "Email não está em um formato válido")
        }
                    
        guard password.isValidPassword() else {
            return (false, "Senha não está em um formato válido")
        }
        
        return (true, "")
    }
}

// MARK: - Input Protocol
extension LoginPresenter: LoginPresenterInputProtocol {
    func authenticate(email: String, password: String) {
        let validation = validateData(email: email, password: password)
        
        if validation.isvalid {
            interactor.authenticate(email: email, password: password)
        } else {
            viewController?.authenticationFailed(message: validation.message)
        }
    }
    
    func showCreateAccountView() {
        router.showCreateAccountView()
    }
    
    func viewDidAppear() {
        trackScreenView()
    }
}

// MARK: - Output Protocol
extension LoginPresenter: LoginInteractorOutputProtocol {
    func authenticationSuccessful() {
        router.showHomeView()
    }
    
    func authenticationFailed() {
        // TODO: Implement 3 attempts by email logic
        
        viewController?.authenticationFailed(message: "Usuário e/ou senha inválidos. Tente novamente.")
    }
}

// MARK: - Analytics
extension LoginPresenter {
    func trackScreenView() {
    }
}
