function App() {
    return (
      <div style={{ padding: "2rem", fontSize: "1.5rem" }}>
        Hello from OHMAP PG Citrix Team!
      </div>
    );
  }
  export default App;
  
  
  src/index.js
  import React from 'react';
  import ReactDOM from 'react-dom/client';
  import App from './App';
  
  const root = ReactDOM.createRoot(document.getElementById('root'));
  root.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>
  );
  