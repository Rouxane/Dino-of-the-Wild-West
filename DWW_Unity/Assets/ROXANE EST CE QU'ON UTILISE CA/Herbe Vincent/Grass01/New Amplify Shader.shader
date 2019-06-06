// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_TexturesCom_Grass11_512_roughness("TexturesCom_Grass11_512_roughness", 2D) = "white" {}
		_TexturesCom_Grass11_512_normal("TexturesCom_Grass11_512_normal", 2D) = "white" {}
		_TexturesCom_Grass11_512_alpha("TexturesCom_Grass11_512_alpha", 2D) = "white" {}
		_TexturesCom_Grass11_512_albedo("TexturesCom_Grass11_512_albedo", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TexturesCom_Grass11_512_normal;
		uniform float4 _TexturesCom_Grass11_512_normal_ST;
		uniform sampler2D _TexturesCom_Grass11_512_albedo;
		uniform float4 _TexturesCom_Grass11_512_albedo_ST;
		uniform sampler2D _TexturesCom_Grass11_512_roughness;
		uniform float4 _TexturesCom_Grass11_512_roughness_ST;
		uniform sampler2D _TexturesCom_Grass11_512_alpha;
		uniform float4 _TexturesCom_Grass11_512_alpha_ST;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexturesCom_Grass11_512_normal = i.uv_texcoord * _TexturesCom_Grass11_512_normal_ST.xy + _TexturesCom_Grass11_512_normal_ST.zw;
			o.Normal = tex2D( _TexturesCom_Grass11_512_normal, uv_TexturesCom_Grass11_512_normal ).rgb;
			float2 uv_TexturesCom_Grass11_512_albedo = i.uv_texcoord * _TexturesCom_Grass11_512_albedo_ST.xy + _TexturesCom_Grass11_512_albedo_ST.zw;
			o.Albedo = tex2D( _TexturesCom_Grass11_512_albedo, uv_TexturesCom_Grass11_512_albedo ).rgb;
			float2 uv_TexturesCom_Grass11_512_roughness = i.uv_texcoord * _TexturesCom_Grass11_512_roughness_ST.xy + _TexturesCom_Grass11_512_roughness_ST.zw;
			o.Smoothness = tex2D( _TexturesCom_Grass11_512_roughness, uv_TexturesCom_Grass11_512_roughness ).r;
			o.Alpha = 1;
			float2 uv_TexturesCom_Grass11_512_alpha = i.uv_texcoord * _TexturesCom_Grass11_512_alpha_ST.xy + _TexturesCom_Grass11_512_alpha_ST.zw;
			clip( tex2D( _TexturesCom_Grass11_512_alpha, uv_TexturesCom_Grass11_512_alpha ).r - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
7;7;1906;1004;603.7148;180.6246;1;True;True
Node;AmplifyShaderEditor.SamplerNode;5;180.3579,221.4212;Float;True;Property;_TexturesCom_Grass11_512_albedo;TexturesCom_Grass11_512_albedo;4;0;Create;True;0;0;False;0;edc00da82ae94bf4e817f8f094a1e2e8;edc00da82ae94bf4e817f8f094a1e2e8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-59.41626,454.2958;Float;True;Property;_TexturesCom_Grass11_512_alpha;TexturesCom_Grass11_512_alpha;3;0;Create;True;0;0;False;0;b16408eab3997bd40a790156685b7be9;b16408eab3997bd40a790156685b7be9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-175.5621,634.577;Float;True;Property;_TexturesCom_Grass11_512_normal;TexturesCom_Grass11_512_normal;2;0;Create;True;0;0;False;0;5e31af00f91c8074ba97bf9739e32d07;5e31af00f91c8074ba97bf9739e32d07;True;0;True;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;212.3968,631.9238;Float;True;Property;_TexturesCom_Grass11_512_roughness;TexturesCom_Grass11_512_roughness;1;0;Create;True;0;0;False;0;d07a901280889a148952fc110fb03f1c;d07a901280889a148952fc110fb03f1c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1917,267;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;5;0
WireConnection;0;1;3;0
WireConnection;0;4;2;0
WireConnection;0;10;4;0
ASEEND*/
//CHKSM=375EF6319A248EFED29644B2A47928E5893A6BC2