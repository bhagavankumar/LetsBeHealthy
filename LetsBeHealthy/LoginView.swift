import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var user: User?

    var body: some View {
        VStack {
            Text("Welcome to StepRewards")
                .font(.largeTitle)
                .padding()
            
            GoogleSignInButton {
                handleGoogleSignIn()
            }
            .padding()

            AppleSignInButton()
                .frame(height: 50)
                .onTapGesture {
                    handleAppleSignIn()
                }
                .padding()
            
            Button("Login with Email") {
                self.user = User(name: "John Doe")
                self.isLoggedIn = true
                isLoggedIn = true // Simulate login
            }
            .padding()
        }
    }

    struct AppleSignInButton: UIViewRepresentable {
        func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
            return ASAuthorizationAppleIDButton()
        }
        func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
    }

    
        // Add Google Sign-In logic here
        func handleGoogleSignIn() {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootViewController = windowScene.windows.first?.rootViewController else {
                print("No root view controller found.")
                return
            }
            
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
                if let error = error {
                    print("Google Sign-In failed: \(error.localizedDescription)")
                    return
                }
                
                guard let user = signInResult?.user else { return }
                print("Google User Signed In: \(user.profile?.name ?? "Unknown")")
                if let signInResult{
                    self.user = User.init(name: signInResult.user.profile?.name ?? "")
                    isLoggedIn = true
                }
                
            }
            
        }

    func handleAppleSignIn() {
        // Add Apple Sign-In logic here
        
        let provider = ASAuthorizationAppleIDProvider()
               let request = provider.createRequest()
               request.requestedScopes = [.fullName, .email]

               let controller = ASAuthorizationController(authorizationRequests: [request])
               controller.delegate = AppleSignInDelegate()
               controller.performRequests()
           }

           // Apple Sign-In Delegate Implementation
           class AppleSignInDelegate: NSObject, ASAuthorizationControllerDelegate {
               func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
                   if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                       let userIdentifier = appleIDCredential.user
                       let fullName = appleIDCredential.fullName
                       let email = appleIDCredential.email

                       print("Apple Sign-In Successful!")
                       print("User ID: \(userIdentifier)")
                       print("Full Name: \(fullName?.givenName ?? "No name") \(fullName?.familyName ?? "")")
                       print("Email: \(email ?? "No email")")
                   }
               }

               func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
                   print("Apple Sign-In Failed: \(error.localizedDescription)")
               }
        
    }
}

