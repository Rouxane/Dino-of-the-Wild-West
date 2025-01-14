// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_Teeth_Base_Color("Teeth_Base_Color", 2D) = "white" {}
		_Teeth_Mixed_AO("Teeth_Mixed_AO", 2D) = "white" {}
		_Teeth_Normal_DirectX("Teeth_Normal_DirectX", 2D) = "bump" {}
		_Teeth_Roughness("Teeth_Roughness", 2D) = "white" {}
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

		uniform sampler2D _Teeth_Normal_DirectX;
		uniform float4 _Teeth_Normal_DirectX_ST;
		uniform sampler2D _Teeth_Base_Color;
		uniform float4 _Teeth_Base_Color_ST;
		uniform sampler2D _Teeth_Roughness;
		uniform float4 _Teeth_Roughness_ST;
		uniform sampler2D _Teeth_Mixed_AO;
		uniform float4 _Teeth_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Teeth_Normal_DirectX = i.uv_texcoord * _Teeth_Normal_DirectX_ST.xy + _Teeth_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Teeth_Normal_DirectX, uv_Teeth_Normal_DirectX ) );
			float2 uv_Teeth_Base_Color = i.uv_texcoord * _Teeth_Base_Color_ST.xy + _Teeth_Base_Color_ST.zw;
			o.Albedo = tex2D( _Teeth_Base_Color, uv_Teeth_Base_Color ).rgb;
			float2 uv_Teeth_Roughness = i.uv_texcoord * _Teeth_Roughness_ST.xy + _Teeth_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _Teeth_Roughness, uv_Teeth_Roughness ) ).r;
			float2 uv_Teeth_Mixed_AO = i.uv_texcoord * _Teeth_Mixed_AO_ST.xy + _Teeth_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _Teeth_Mixed_AO, uv_Teeth_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
-7;10;1906;1004;953;500.5;1;True;False
Node;AmplifyShaderEditor.SamplerNode;4;-395,149.5;Float;True;Property;_Teeth_Roughness;Teeth_Roughness;3;0;Create;True;0;0;False;0;7ca2d02364668b649b4a348ffcbe3ada;7ca2d02364668b649b4a348ffcbe3ada;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-242,-389.5;Float;True;Property;_Teeth_Base_Color;Teeth_Base_Color;0;0;Create;True;0;0;False;0;8817b08c512552b489c3b2350094be67;8817b08c512552b489c3b2350094be67;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-402,-142.5;Float;True;Property;_Teeth_Normal_DirectX;Teeth_Normal_DirectX;2;0;Create;True;0;0;False;0;2d8b05cfa0e5f80408c2d5393c27cb93;2d8b05cfa0e5f80408c2d5393c27cb93;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;5;96,61.5;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;77,252.5;Float;True;Property;_Teeth_Mixed_AO;Teeth_Mixed_AO;1;0;Create;True;0;0;False;0;586a07675a3293445b6132e2d0a22882;586a07675a3293445b6132e2d0a22882;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;563,-121;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;4;0
WireConnection;0;0;1;0
WireConnection;0;1;3;0
WireConnection;0;4;5;0
WireConnection;0;5;2;0
ASEEND*/
//CHKSM=089E2EF8C13947532B09FE71B0606D2EAF0286C0