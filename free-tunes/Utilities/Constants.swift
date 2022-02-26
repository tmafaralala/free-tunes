//
//  Constants.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import Foundation

struct Constants {

    static let authConnectionUrl = URL(string:
            """
                https://connect.deezer.com/oauth/auth.php?
                app_id=529242&redirect_uri=
                https://relaxed-rosalind-7f7fa5.netlify.app
            """)
    var accessTokenUrl: String =
        """
            https://connect.deezer.com/oauth/access_token
            .php?app_id=529242&secret=
            9db9a2dd58f982667e01928f0617da1f&code=
        """
    static let exploreContentUrl = URL(string:
    """
        https://api.deezer.com/user/me/recommendations
        /releases&access_token="+authManager.userAuthToken
    """)
}
