// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_lambert1_Roughness("lambert1_Roughness", 2D) = "white" {}
		_lambert1_Normal_DirectX("lambert1_Normal_DirectX", 2D) = "bump" {}
		_lambert1_Mixed_AO("lambert1_Mixed_AO", 2D) = "white" {}
		_lambert1_Metallic("lambert1_Metallic", 2D) = "white" {}
		_lambert1_Base_Color("lambert1_Base_Color", 2D) = "white" {}
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

		uniform sampler2D _lambert1_Normal_DirectX;
		uniform float4 _lambert1_Normal_DirectX_ST;
		uniform sampler2D _lambert1_Base_Color;
		uniform float4 _lambert1_Base_Color_ST;
		uniform sampler2D _lambert1_Metallic;
		uniform float4 _lambert1_Metallic_ST;
		uniform sampler2D _lambert1_Roughness;
		uniform float4 _lambert1_Roughness_ST;
		uniform sampler2D _lambert1_Mixed_AO;
		uniform float4 _lambert1_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_lambert1_Normal_DirectX = i.uv_texcoord * _lambert1_Normal_DirectX_ST.xy + _lambert1_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _lambert1_Normal_DirectX, uv_lambert1_Normal_DirectX ) );
			float2 uv_lambert1_Base_Color = i.uv_texcoord * _lambert1_Base_Color_ST.xy + _lambert1_Base_Color_ST.zw;
			o.Albedo = tex2D( _lambert1_Base_Color, uv_lambert1_Base_Color ).rgb;
			float2 uv_lambert1_Metallic = i.uv_texcoord * _lambert1_Metallic_ST.xy + _lambert1_Metallic_ST.zw;
			o.Metallic = tex2D( _lambert1_Metallic, uv_lambert1_Metallic ).r;
			float2 uv_lambert1_Roughness = i.uv_texcoord * _lambert1_Roughness_ST.xy + _lambert1_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _lambert1_Roughness, uv_lambert1_Roughness ) ).r;
			float2 uv_lambert1_Mixed_AO = i.uv_texcoord * _lambert1_Mixed_AO_ST.xy + _lambert1_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _lambert1_Mixed_AO, uv_lambert1_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
1;1;1918;1016;-221.3637;469.9747;1;False;False
Node;AmplifyShaderEditor.SamplerNode;1;484.5189,88.72786;Float;True;Property;_lambert1_Roughness;lambert1_Roughness;0;0;Create;True;0;0;False;0;34f374d2104c229489ecd7645fbdf202;34f374d2104c229489ecd7645fbdf202;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;547.3915,-389.6753;Float;True;Property;_lambert1_Base_Color;lambert1_Base_Color;4;0;Create;True;0;0;False;0;909c43ff46af0e0418c43b105fc57839;909c43ff46af0e0418c43b105fc57839;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;933.1208,7.305115;Float;True;Property;_lambert1_Metallic;lambert1_Metallic;3;0;Create;True;0;0;False;0;9b2b45a9810cb7943a97d501165047c5;9b2b45a9810cb7943a97d501165047c5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;928.0181,-193.0447;Float;True;Property;_lambert1_Normal_DirectX;lambert1_Normal_DirectX;1;0;Create;True;0;0;False;0;407c44e239fa2724eb065fa9d4c27d27;407c44e239fa2724eb065fa9d4c27d27;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;1133.027,339.0784;Float;True;Property;_lambert1_Mixed_AO;lambert1_Mixed_AO;2;0;Create;True;0;0;False;0;ad342728b2a9ce44b9aa9203a6106151;ad342728b2a9ce44b9aa9203a6106151;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;6;926.3638,242.0253;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1727.811,-115.1874;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;1;0
WireConnection;0;0;5;0
WireConnection;0;1;2;0
WireConnection;0;3;4;0
WireConnection;0;4;6;0
WireConnection;0;5;3;0
ASEEND*/
//CHKSM=375BE6FF26848818492CA64432C42FAB8CF31731