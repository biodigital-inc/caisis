using System;
using System.Security.Cryptography;
using System.Text;
using System.IO;

using DP;

namespace Caisis.Security
{
	public class CustomCryptoHelper
	{
		// UTF8 -> bytes -> base64
		public static string EasyEncrypt(string plainText)
		{
			byte[] encryptedBytes = Encoding.UTF8.GetBytes(plainText);
			return Convert.ToBase64String(encryptedBytes);
		}

		// base64 -> bytes -> UTF8
		public static string EasyDecrypt(string encryptedStr)
		{
			if (encryptedStr != String.Empty)  
			{
				byte[] encryptedBytes = Convert.FromBase64String(encryptedStr);
				return Encoding.UTF8.GetString(encryptedBytes);
			}
			else 
			{
				return "";
			}
		}

		public static string Encrypt(string plaintext)
		{
			return  CryptoServices.Encrypt(plaintext);
		}

		public static string Decrypt(string ciphertext)
		{
			return CryptoServices.Decrypt(ciphertext);
		}
	}
}
