present(alert, animated: true, completion: nil)
    }
    
    func loginSuccess() {
        updateUser()
    }
}

// MARK: - Login flow functions -

extension LoginViewController {
    func credentialsExist() -> Bool {
        return LoginCredentials.getUserId() != nil
    }
    
    func credentialsExpired() -> Bool {
        if let credentials = LoginCredentials.getCredentials() {
            return credentials.isExpired()
        }
        return true
    }
    
    func updateUser() {
        if APIManager.manager.reachability.connection == .none {
            return
        }
        updateUserInProgress = true
        interactor?.checkCurrentUserRequest()
    }
}
