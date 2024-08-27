# Course Completion Badge
![SKILL](https://github.com/user-attachments/assets/95a34001-d60d-41a0-b147-32492b2d69d5)

Vision
The CourseCompletionBadge smart contract provides a decentralized and transparent way to issue and manage digital badges for course completions. This contract allows an administrator to mint badges, manage their issuance, and revoke them as needed. Each badge is uniquely identified and contains details about the course and the recipient, ensuring that credentialing is secure and verifiable on the Ethereum blockchain.

Flowchart

+-----------------------+
|   Deploy Contract     |
+-----------------------+
            |
            v
+-----------------------+
|   Transfer Ownership  |
+-----------------------+
            |
            v
+-----------------------+            +---------------------+
|   Mint Badge          |  --->  | BadgeMinted Event   |
+-----------------------+            +---------------------+
            |
            v
+-----------------------+            +---------------------+
|   Mint Badges (Batch) |  --->  | BadgeMinted Event   |
+-----------------------+            +---------------------+
            |
            v
+-----------------------+
|   Get Badge Details   |
+-----------------------+
            |
            v
+-----------------------+
|   Revoke Badge        |
+-----------------------+            +---------------------+
            |                          | BadgeRevoked Event |
            v                          +---------------------+
+-----------------------+
|   Badge Data Deleted  |
+-----------------------+



Contract Address

Contract Address: 0x9d5a500Cf688c87cDB5A4fd7aD13f556b6dB0d28

Future Scope

1. Role-Based Access Control: Implement additional roles (e.g., instructors) with permission-based access to mint badges.
2. Badge Verification: Develop a front-end application to allow users to easily verify badge authenticity.
3. Integration with Learning Management Systems (LMS): Connect the smart contract with LMS platforms for automated badge issuance.
4. Improved Metadata: Enhance badges with more detailed metadata, including course completion criteria and expiration dates.


Contact Details

For any inquiries or support related to the Course Completion Badge project, please contact:

Name: Bastab Gogoi
Email: bastabgogoibtcs@adtu.in
