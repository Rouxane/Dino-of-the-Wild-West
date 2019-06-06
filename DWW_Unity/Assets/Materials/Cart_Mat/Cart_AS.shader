// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_blinn2_Base_Color("blinn2_Base_Color", 2D) = "white" {}
		_blinn2_Metallic("blinn2_Metallic", 2D) = "white" {}
		_blinn2_Mixed_AO("blinn2_Mixed_AO", 2D) = "white" {}
		_blinn2_Normal_DirectX("blinn2_Normal_DirectX", 2D) = "bump" {}
		_blinn2_Roughness("blinn2_Roughness", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _blinn2_Normal_DirectX;
		uniform float4 _blinn2_Normal_DirectX_ST;
		uniform sampler2D _blinn2_Base_Color;
		uniform float4 _blinn2_Base_Color_ST;
		uniform sampler2D _blinn2_Metallic;
		uniform float4 _blinn2_Metallic_ST;
		uniform sampler2D _blinn2_Roughness;
		uniform float4 _blinn2_Roughness_ST;
		uniform sampler2D _blinn2_Mixed_AO;
		uniform float4 _blinn2_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_blinn2_Normal_DirectX = i.uv_texcoord * _blinn2_Normal_DirectX_ST.xy + _blinn2_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _blinn2_Normal_DirectX, uv_blinn2_Normal_DirectX ) );
			float2 uv_blinn2_Base_Color = i.uv_texcoord * _blinn2_Base_Color_ST.xy + _blinn2_Base_Color_ST.zw;
			o.Albedo = tex2D( _blinn2_Base_Color, uv_blinn2_Base_Color ).rgb;
			float2 uv_blinn2_Metallic = i.uv_texcoord * _blinn2_Metallic_ST.xy + _blinn2_Metallic_ST.zw;
			o.Metallic = tex2D( _blinn2_Metallic, uv_blinn2_Metallic ).r;
			float2 uv_blinn2_Roughness = i.uv_texcoord * _blinn2_Roughness_ST.xy + _blinn2_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _blinn2_Roughness, uv_blinn2_Roughness ) ).r;
			float2 uv_blinn2_Mixed_AO = i.uv_texcoord * _blinn2_Mixed_AO_ST.xy + _blinn2_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _blinn2_Mixed_AO, uv_blinn2_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
14;15;1906;1004;953;500.5;1;True;False
Node;AmplifyShaderEditor.SamplerNode;5;-384,221.5;Float;True;Property;_blinn2_Roughness;blinn2_Roughness;4;0;Create;True;0;0;False;0;31ecd21c6d6018243897ad442e7f75f9;31ecd21c6d6018243897ad442e7f75f9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;6;114,135.5;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;-251,-15.5;Float;True;Property;_blinn2_Metallic;blinn2_Metallic;1;0;Create;True;0;0;False;0;e37e0c0fcf181e54cada6304392308b5;e37e0c0fcf181e54cada6304392308b5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-591,-148.5;Float;True;Property;_blinn2_Normal_DirectX;blinn2_Normal_DirectX;3;0;Create;True;0;0;False;0;bd963560875615647af43020e9bae93d;bd963560875615647af43020e9bae93d;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-243,-335.5;Float;True;Property;_blinn2_Base_Color;blinn2_Base_Color;0;0;Create;True;0;0;False;0;1f072cd9958956f43a3710be2bc48916;1f072cd9958956f43a3710be2bc48916;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;86,254.5;Float;True;Property;_blinn2_Mixed_AO;blinn2_Mixed_AO;2;0;Create;True;0;0;False;0;cfd10b2df7c160d4a9000d210e09b5e6;cfd10b2df7c160d4a9000d210e09b5e6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;492,-72;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;5;0
WireConnection;0;0;1;0
WireConnection;0;1;4;0
WireConnection;0;3;2;0
WireConnection;0;4;6;0
WireConnection;0;5;3;0
ASEEND*/
//CHKSM=B7770EE1D0A61F93C56E67BD8BC38FD8F6E390EE