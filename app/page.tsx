import React from "react";

export default function Home() {
  return (
    <main style={{ maxWidth: 780, margin: "40px auto", padding: 24 }}>
      <h1 style={{ fontSize: 48, margin: "8px 0" }}>🪰 FLY</h1>
      <p style={{ fontSize: 18, lineHeight: 1.6 }}>
        Public repo is live. Documentation first. MVP will be a 1v1 turn based PvP duel on Solana.
      </p>

      <h2>Links</h2>
      <ul>
        <li><a href="https://github.com/khusairy/fly-game">GitHub repo</a></li>
        <li><a href="https://solscan.io/token/GuESBCj3f2UtazxZWNsoZxv1iV33RZzVTfytoLCjmfLY">FLY token on Solscan</a></li>
      </ul>

      <h2>Status</h2>
      <p>CI will pull private repos and copy IDLs and exported assets into this app.</p>

      <h2>Getting started</h2>
      <ol>
        <li>Install deps: <code>npm ci</code></li>
        <li>Run locally: <code>npm run dev</code></li>
      </ol>

      <p style={{ opacity: 0.7 }}>30 seconds to act - draw or fall.</p>
    </main>
  );
}
