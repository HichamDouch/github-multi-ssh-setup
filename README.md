# 🚀 GitHub Multi SSH Setup Script  

Easily configure multiple GitHub accounts with SSH keys and switch between them seamlessly!  

## ✨ Features  
✅ Generate and configure SSH keys for multiple GitHub accounts  
✅ Automatically update `~/.ssh/config` for easy switching  
✅ Display SSH keys at the end for manual addition to GitHub  
✅ Supports execution via **Git, Bun, or NPM/Yarn**  

---

## 📥 Installation  

### **1️⃣ Using Git (Recommended)**  
```sh
git clone https://github.com/your-username/github-multi-ssh-setup.git
cd github-multi-ssh-setup
chmod +x setup-github-ssh.sh
```

### **2️⃣ Using Bun (Without Cloning)**  
```sh
bunx your-github-username/github-multi-ssh-setup
```

### **3️⃣ Using NPM/Yarn** *(After publishing to NPM)*  
```sh
npm install -g github-multi-ssh-setup
github-ssh-setup
```

---

## 🚀 Usage  

### **Run the script**  
```sh
./setup-github-ssh.sh
```
or if using **Bun**:  
```sh
bun run setup
```

---

## 📌 How It Works  
1️⃣ Prompts how many GitHub accounts you want to add  
2️⃣ Asks for **email** and **unique key name** for each account  
3️⃣ Generates SSH keys and adds them to **`~/.ssh/config`**  
4️⃣ Displays SSH keys at the end for manual GitHub addition  

---

## 🎯 Example  

```
🚀 GitHub Multiple Account SSH Setup
How many GitHub accounts do you want to add? 2
➡️ Setting up GitHub account #1
Enter email: user1@example.com
Enter a unique key name (e.g., personal, work): personal
✅ SSH Key Generated for personal

➡️ Setting up GitHub account #2
Enter email: user2@example.com
Enter a unique key name: work
✅ SSH Key Generated for work

📌 **Add the following SSH keys to GitHub:**
📧 Email: user1@example.com
🔑 SSH Key: ssh-rsa AAAAB3Nz...
📧 Email: user2@example.com
🔑 SSH Key: ssh-rsa AAAAB3Nz...
📝 Go to https://github.com/settings/keys and add them!
```

---

## 🔄 Switching Between Accounts  

After adding SSH keys to GitHub, use the correct hostname when cloning:  

- **Personal Account**  
  ```sh
  git clone git@github-personal:your-username/repo.git
  ```
- **Work Account**  
  ```sh
  git clone git@github-work:your-username/repo.git
  ```

---

## 🛠️ Testing SSH Connection  
After adding keys to GitHub, test the connection:  
```sh
ssh -T git@github-personal
ssh -T git@github-work
```
Expected output:  
```
Hi your-username! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## 📜 License  
This project is **open-source** under the [MIT License](LICENSE).  

---

## 💡 Contributing  
Feel free to open issues or submit pull requests!  


